<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.fisc.hash.hash"%>
<%@ page language="java" import="java.net.URLDecoder"%>
<%@ page language="java" import="java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Sale回傳頁面</title>
		<style type="text/css">
			html, body {
			margin: 0;
			text-align: center;
			}
			#d1 {
			position: relative;
			margin: 0 auto;
			width: 760px;
			text-align: center;
			}
		</style>
	</head>
	<%
		String Key = "04E61A6ABAC70D44D3E64648A29CD171E732549DB3CD5CAF";
		
		String acqBank = request.getParameter("acqBank")!=null?(String)request.getParameter("acqBank"):"";
		String terminalId = request.getParameter("terminalId")!=null?(String)request.getParameter("terminalId"):"";
		String merchantId = request.getParameter("merchantId")!=null?(String)request.getParameter("merchantId"):"";
		String orderNumber = request.getParameter("orderNumber")!=null?(String)request.getParameter("orderNumber"):"";
		String cardPlan = request.getParameter("cardPlan")!=null?(String)request.getParameter("cardPlan"):"";
		String responseCode = request.getParameter("responseCode")!=null?(String)request.getParameter("responseCode"):"";
		String signatureType = request.getParameter("signatureType")!=null?(String)request.getParameter("signatureType"):"";
		
		//ServletContext context = pageContext.getServletContext();
	//	String ClassFolder = this.getClass().getClassLoader().getResource("/").getPath();
	//	String WebFolder=request.getRealPath("").concat(String.valueOf(File.separatorChar)).concat("WebtoApp").concat(String.valueOf(File.separatorChar));
		
	//	String keyPath = WebFolder.concat("Key").concat(String.valueOf(File.separatorChar))
	//					.concat(merchantId).concat("_")
	//					.concat(terminalId).concat(".key");
	//	File files = new File(keyPath);
	//	if(files.isFile()){
	//		BufferedReader br = new BufferedReader(new FileReader(files));
	//		StringBuilder sb = new StringBuilder();
	//		Key = br.readLine();
	//	}
		
		String respVerifyCode = request.getParameter("verifyCode")!=null?(String)request.getParameter("verifyCode"):"";
		String txtInput = acqBank + cardPlan + merchantId + orderNumber + responseCode + terminalId + Key;
		String CheckValue = "";
		String CalToken = hash.calu(txtInput).toUpperCase();
		
		if(respVerifyCode.equals(CalToken)){ 
			CheckValue="PASS"; 
		} else if(respVerifyCode.equals(CalToken.toLowerCase())){ 
			CheckValue="PASS"; 
		} else{
			CheckValue="FAIL";
		} 

		String errDesc = request.getParameter("errDesc")!=null?(String)request.getParameter("errDesc"):"";
		errDesc=URLDecoder.decode(errDesc, "UTF-8");
		
/*		FileOutputStream fos=new FileOutputStream("C:/tomcat/logs/Inbound/Sale.log", true); 
		PrintWriter pw=new PrintWriter(fos); 
		pw.println("==================================");
		

		pw.println("收單行代碼 : " + acqBank);
		pw.println("端末代號 : " + terminalId); 
		pw.println("特店代號 : " + merchantId); 
		pw.println("訂單編號 : " + orderNumber);		
		pw.println("交易卡別 : " + cardPlan);
		pw.println("回應碼 : " + responseCode);
		pw.println("RESP驗證碼 : " + respVerifyCode); 
		pw.println("驗證碼押碼方式 : " + signatureType); 
		pw.println("錯誤描述 : " + errDesc); 
		pw.println("RESP驗證碼 Check : " + CheckValue); 
		pw.close(); 
		fos.close(); */
		
	%>
	
	<body>
		<div id='d2' align="center">
			<table BORDER='1' align="center">
				<TR>                                                          
			        <TD><b>收單行代碼</b></TD>                                 
			        <TD><FONT COLOR=RED><%= acqBank %></FONT></TD>  
				</TR>
				<TR>                                                          
			        <TD><b>特店代號</b></TD>                                 
			        <TD><FONT COLOR=RED><%= merchantId %></FONT></TD>  
				</TR>
				<TR>                                                          
			        <TD><b>端末代號</b></TD>                                 
			        <TD><FONT COLOR=RED><%= terminalId %></FONT></TD>  
				</TR>
				<TR>                                                          
			        <TD><b>訂單編號</b></TD>                                 
			        <TD><FONT COLOR=RED><%= orderNumber %></FONT></TD>  
				</TR>				     
				<TR>                                                          
			        <TD><b>交易卡別</b></TD>                                 
			        <TD><FONT COLOR=RED><%= cardPlan %></FONT></TD>  
				</TR>
				<TR>                                                          
			        <TD><b>RESP驗證碼</b></TD>                                 
			        <TD><FONT COLOR=RED><%= respVerifyCode %></FONT></TD>  
				</TR>
				<TR>                                                          
			        <TD><b>回應碼</b></TD>                                 
			        <TD><FONT COLOR=RED><%= responseCode %></FONT></TD>  
				</TR>
				<TR>                                                          
			        <TD><b>驗證碼押碼方式</b></TD>                                 
			        <TD><FONT COLOR=RED><%= signatureType %></FONT></TD>  
				</TR>
				<TR>                                                          
			        <TD><b>錯誤描述</b></TD>                                 
			        <TD><FONT COLOR=RED><%= errDesc %></FONT></TD>  
				</TR>

				<TR>
				</TR>
				<TR>
					<TD><b>SHA-256 input</b></TD>
					<TD><FONT COLOR=GREEN><%= txtInput %></FONT></TD>  
				</TR>
				<TR>
					<TD><b>SHA-256 Calculate</b></TD>
					<TD><FONT COLOR=GREEN><%= CalToken %></FONT></TD>  
				</TR>
				<TR>
					<TD><b>RESP驗證碼 Check</b></TD>
					<TD><FONT COLOR=GREEN><%= CheckValue %></FONT></TD>  
				</TR>
			</table>
		</div>
	</body>
</html>
