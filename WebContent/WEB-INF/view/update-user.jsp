<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>

<head>
	<title>Save Customer</title>
  <script src="<c:url value='/resources/js/scripts/userReg.js'/>"></script>

 </head>

<body>
<%@include file="header.jsp" %>
<%@include file="side-layout.jsp" %>
<script type="text/javascript">

$( document ).ready(function() {
	

    $(document).on("click","#userSubmit",
      		 function() {
        var file_data = $('#uploadfile').prop( 'files')[0];
       
        var form_data = new FormData();
        form_data.append('filedata', file_data);
     
      $("#empForm").attr("file",form_data);
      $( "#empForm" ).submit();

       
        console.log(form_data);
        /*    $
            .ajax({
                url: 'createUser',
                data: form_data,
                async: false,
                dataType: 'text',
                processData: false,
                contentType: false,
                type: 'POST',
                beforeSend: function(xhr) {
                  //  xhr.setRequestHeader( 'X-CSRF-Token', $(  '#secureToken') .val());
                },
                success: function(data,  textStatus, jqXHR) {

                    if (data == "1") {
                   	 
                   	 alert("Save successfully");

                    } else {
                   	 alert("Save successfully");
                    }
                },
                error: function(jqXHR,
                    textStatus,
                    errorThrown) {
                    alert(textStatus,
                        errorThrown);
                }
            }); */
    });
	
});

function getEmpDistrict() {
	var stcode = $("#stateCode").val();
//alert(stcode);
	$.ajax({
		url:"alldistrict",
		data :{"id":stcode},
		type:"post",
		success:function(data){

			var html = '<option value="" label="--Select--"></option>';
			
		
			var len = data.length;
		
			for (var i = 0; i < len; i++) {
				 
				html += '<option value="' + data[i].districtCode + '" label="'
				+ data[i].districtDesc + '"></option>';
			}
		
			$('#districtCode_id').html("");
			$('#districtCode_id').html(html); 
			
		},error:function(e){
			
		}
		

});
}
</script>
<div class="content-wrapper" style="min-height: 990px;">
    
    

    <!-- Main content -->
    <section class="content">
      <div class="row">
			<div class="col-md-8 col-md-offset-2" >
				<div class="userCreation">
				<div class="panel panel-primary">
				
				<div class="panel-heading"><h3 class="panel-title">Register</h3></div>
					<div class="panel-body">
						<form:form  modelAttribute="employee" method="POST" id="empForm" enctype="multipart/form-data" 
						 action="updateEmployee">
											
						<div class="form-inline">
						 <div class="col-md-6">
						  <div class="form-group">
						    <label class="proLabel">First name:</label>
						    <form:input class="proInput form-control" path="firstName" required="required" />
						    <form:errors cssStyle="color:red;"  path="firstName"  ></form:errors>
						  </div>
						 </div>  
						 
						 <div class="col-md-6">
						  <div class="form-group">
						    <label class="proLabel">Last name:</label>
						    <form:input class="proInput form-control" path="lastName" />
						  </div>
						 </div> 
						</div>
						
						<div class="form-inline">
						 <div class="col-md-6">
						  <div class="form-group">
						    <label class="proLabel">Email:</label>
						    <form:input class="proInput form-control" path="emailId" readonly="true" />
						      <form:errors cssStyle="color:red;"  path="emailId"  ></form:errors>
						    
						  </div>
						 </div>  
						 
						 <div class="col-md-6">
						  <div class="form-group">
						    <label class="proLabel">Mobile Number:</label>
						    <form:input class="proInput form-control" path="mobileNumber" />
						  </div>
						 </div> 
						</div>
						
						
						<div class="form-inline">
						 <div class="col-md-6">
						  <div class="form-group">
						    <label class="proLabel">Date of birth:</label>
						    <form:input class="proInput form-control" path="DOB" />
						  </div>
						 </div>  
						 
						  <div class="col-md-6">
						  <div class="form-group">
						    <label class="proLabel">Gender:</label>
					    <form:select class="proInput form-control" path="gender" id="genderDesc_id" >
										<form:option value="" label="--Select Gender --" />
										<form:options items="${allgender}" itemValue="genderId" itemLabel="genderDesc" />
								</form:select>	
						  </div>
						 </div>  
						</div>
						<div class="form-inline">
						 <div class="col-md-6">
						  <div class="form-group">
						    <label class="proLabel">City:</label>
						    <form:input class="proInput form-control" path="city" />
						  </div>
						 </div>  
						 
						 <div class="col-md-6">
						  <div class="form-group">
						    <label class="proLabel">Address:</label>
						    <form:textarea class="proInput form-control" path="address"  />
						  </div>
						 </div> 
						</div>
						
						<div class="form-inline">
						 <div class="col-md-6">
						  <div class="form-group">
						    <label class="proLabel">State:</label>
						    <form:select class="proInput form-control" path="stateCodedesc" id="stateCode" onchange="getEmpDistrict();" >
										<form:option value="" label="--Select State --" />
										<form:options items="${allstate}" itemValue="stateCode" itemLabel="stateDesc" />
								</form:select>	
						  </div>
						 </div>  
						 
						 <div class="col-md-6">
						  <div class="form-group">
						    <label class="proLabel">District:</label>
						    <form:select class="proInput form-control" path="districtCodeDesc" id="districtCode_id" >
									<form:option value="" label="--Select District --" />
										</form:select>		
						  </div>
						 </div> 
						</div>
						
						<div class="form-inline">
						 <div class="col-md-6">
						  <div class="form-group">
						    <label class="proLabel">Postal Code:</label>
						    <form:input class="proInput form-control" path="postalCode" />
						  </div>
						 </div>  
						 
						 <div class="col-md-6">
						  <div class="form-group">
						    <label class="proLabel">Designation:</label>
						    <form:input class="proInput form-control" path="designation" />
						  </div>
						 </div>  
						 </div>
						 
						 <div class="form-inline">
						  <div class="col-md-6">
						  <div class="form-group">
						    <label class="proLabel">User Type:</label>
					    <form:select class="proInput form-control" path="userType" id="typeDesc_id" >
										<form:option value="" label="--Select Type --" />
										<form:options items="${alltypes}" itemValue="roleId" itemLabel="typeDesc" />
								</form:select>	
						  </div>
						 </div>  
						 
						 <div class="col-md-6">
						  <div class="form-group">
						    <label class="proLabel">Upload:</label>
						   <form:input class="proInput form-control" type="file" path="file" id="uploadfile" />
						  </div>
						 </div> 
						</div>
						
						 <div class="form-inline">
						  <div class="col-md-6">
						  <div class="form-group">
						    <label class="proLabel">User Role:</label>
					    <form:select class="proInput form-control" path="userRole" id="role_id" >
										<form:option value="" label="--Select Role --" />
										<form:options items="${allroles}" itemValue="roleId" itemLabel="roleDesc" />
								</form:select>	
						  </div>
						 </div>  </div>
				        
				        
				        <div class="text-center">
				         <input type="button" id="userSubmit" value="Save"  class="btn btn-primary" >
				        </div>
									    
						</form:form>
							<p class="backToLogin">
							<a href="${pageContext.request.contextPath}/login">Back to Login</a>
						</p>
						</div>
						</div>
						
				</div>		
</div>
</div>
</section>
</div>
</body>

</html>