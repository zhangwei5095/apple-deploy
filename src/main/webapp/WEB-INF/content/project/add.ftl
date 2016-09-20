<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<title>新增项目</title>
<#include "/content/commons/page_css.ftl" />
<#include "/content/commons/page_js.ftl" />

<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
		
	// 表单验证
	$inputForm.validate({
		rules: {
			"name": {
				required: true,
				remote: "check_name"
			}
		},
		messages: {
			"name": {
				required: "必填",
				remote: "项目已存在"
			}
		},
		submitHandler:function(form){
            form.submit();
        }
	});
	
	$("#btn_pop_submitA").click(function(){
 		$inputForm.submit();
	});
	
	$(".projectType").click(function(){
    	proccessType();
	});
	
	proccessType();
	
});

function proccessType() {
		var val = $('input:radio[name="type"]:checked').val();
        if(val == null){
            return false;
       	}
        else{
			if(val == 1) {
				$(".noshell").show();
			}
			else {
				$(".noshell").hide();
			}
        }
}
</script>

</head>

<body>
<form id="inputForm" method="post" action="save">
	
    <div id="auditTab" class="pop_main" style="width:600px;border: 0px solid; height:420px; overflow:auto;">

       <div class="pop_information_mod">
            <ul class="pop_list merchant_type_add">
            
                	<li class="clearfix">
                		<label for="name require" class="tit">名称：<span class=" red">*</span></label>
                		<input class="c_input_text required" type="text" style="width:200px;" name="name" value="" realValue="请输入名称"  />
               		</li>

                	<li class="clearfix projectType">
                		<label for="type" class="tit">类型：<span class=" red">*</span></label>
               			<input id="type" type="radio" name="type" value="1" checked="checked" />工程项目
                		<input id="type" type="radio" name="type" value="0" />脚本项目
                	</li>
                	
                	<li class="clearfix">
                		<label for="type" class="tit">状态：<span class=" red">*</span></label>
               			<input type="radio" name="status" value="1" checked="checked" />启用
                		<input type="radio" name="status" value="0" />停用
                	</li>
                	
                	<li class="clearfix">
                		<label for="type" class="tit">审核：<span class=" red">*</span></label>
               			<input type="radio" name="isAudit" value="1" checked="checked" />是
                		<input type="radio" name="isAudit" value="0" />否
                	</li>

					<li class="clearfix">
                		<label for="env" class="tit">部署环境：<span class=" red">*</span></label>
                		<select class="c_select" name="env" style="width:150px;" id="env">
                		<#list envTypeList as env>
							<option value="${env.getIndex()}">
								${env.getName()}
							</option>
						</#list>
						</select>
                	</li>
                	<li class="clearfix">
                		<label for="env" class="tit">部署插件：<span class=" red">*</span></label>
                		<select class="c_select" name="plus" style="width:150px;" id="plus">
                		<#list plusTypeList as plus>
							<option value="${plus.getIndex()}">
								${plus.getName()}
							</option>
						</#list>
						</select>
                	</li>
                	
                	<li class="clearfix">
                		<label for="version " class="tit">当前版本：<span class=" red">*</span></label>
                		<input class="c_input_text required" type="text" style="width:200px;" name="version" value="" realValue="请输入当前版本"  />
               		</li>
               		
                	<li class="clearfix noshell">
	                    <label for="nexusUrl" class="tit">Nexus'地址：</label>
	                    <input class="c_input_text" type="text" style="width:200px;" name="nexusUrl" value="" realValue="请输入Nexus'地址"  />
                	</li>
                	<li class="clearfix noshell">
	                    <label for="nexusGroup" class="tit">Nexus'GROUP：</label>
	                    <input class="c_input_text" type="text" style="width:200px;" name="nexusGroup" value="" realValue="请输入Nexus'GROUP"  />
                	</li>
            
                	<li class="clearfix noshell">
	                    <label for="nexusArtifact" class="tit">Nexus'ARTIFACT：</label>
	                    <input class="c_input_text" type="text" style="width:200px;" name="nexusArtifact" value="" realValue="请输入Nexus'ARTIFACT"  />
                	</li>
                	
                	<li class="clearfix">
	                    <label for="releaseUser" class="tit">部署用户：</label>
	                    <input class="c_input_text required" type="text" style="width:200px;" name="releaseUser" value="" realValue="请输入部署用户"  />
                	</li>
                	<li class="clearfix">
	                    <label for="releaseTo" class="tit">部署目录：</label>
	                    <input class="c_input_text required" type="text" style="width:200px;" name="releaseTo" value="" realValue="请输入部署目录"  />
                	</li>
                	
                	<li class="clearfix">
	                    <label for="hosts" class="tit">服务器列表：</label>
	                    <span class="textarea_show">
	                    	<textarea class="c_textarea" name="hosts" cols="" id="hosts" rows=""></textarea>
	                    </span>
                	</li>
                	<li class="clearfix">
	                    <label for="preDeploy" class="tit">部署前置任务：</label>
	                    <span class="textarea_show">
	                    	<textarea class="c_textarea" name="preDeploy" cols="" id="preDeploy" rows=""></textarea>
	                    </span>
                	</li>
                	<li class="clearfix">
	                    <label for="postDeploy" class="tit">部署任务：</label>
	                    <span class="textarea_show">
	                    	<textarea class="c_textarea" name="postDeploy" cols="" id="postDeploy" rows=""></textarea>
	                    </span>
                	</li>
                	<li class="clearfix">
	                    <label for="afterDeploy" class="tit">部署后置任务：</label>
	                    <span class="textarea_show">
	                    	<textarea class="c_textarea" name="afterDeploy" cols="" id="afterDeploy" rows=""></textarea>
	                    </span>
                	</li>
            </ul>

        </div>

    </div>
    <div class="pop_footer">
        <a id="btn_pop_submitA" class="btn_pop_submitA" href="javascript:void(0)">确定</a>
        <a id="btn_pop_submitB" class="btn_pop_submitB" href="javascript:void(0)" onclick="art.dialog.close();">取消</a>
    </div>


</form>


</body>
</html>