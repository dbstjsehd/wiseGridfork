<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="xlib.cmc.OperateGridData"%>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <title>기본예제 - 기본</title>
  <link rel='stylesheet' href='/css/wisegrid.css' type='text/css'>
  <script type='text/javascript' src='/js/WiseGrid_TAG.js'></script>
  <script type='text/javascript' src='/js/WiseGrid_Property.js'></script>
  <script type='text/javascript' src='/js/WiseGrid_Basic_Sample.js'></script>
  <script language=javascript for="WiseGrid" event="Initialize()">
    init();
  </script>

  <script language=javascript for="WiseGrid" event="EndQuery()">
    GridEndQuery();
  </script>

  <script language=javascript for="WiseGrid" event="CellClick(strColumnKey,nRow)">
    GridCellClick(strColumnKey, nRow)
  </script>

  <script language=javascript for="WiseGrid" event="ChangeCell(strColumnKey,nRow,nOldValue,nNewValue)">
    GridChangeCell(strColumnKey, nRow);
  </script>

  <script language=javascript for="WiseGrid" event="CellDblClick(strColumnKey, nRow)">
    alert("Cell DBClick");
  </script>




  <script>
    function init() {
      var GridObj = document.WiseGrid;
      setHeader(GridObj);
      setProperty(GridObj);
      GridObj.bHDMoving = false;
      GridObj.bHDSwapping = false;
      GridObj.bRowSelectorVisible = false;
      GridObj.strRowBorderStyle = "none";
      GridObj.nRowSpacing = 0;
      GridObj.strHDClickAction = "select";
      GridObj.strBgImage = "/images/unipost_logo_white.gif";
      GridObj.bUserContextMenu = true;


      GridObj.strScrollBars = "none";

      GridObj.SetColHDCheckBoxVisible('SELECTED',true,false);

    }


    function setHeader(GridObj) {
      GridObj.AddHeader("SEQ_NO",			"SEQ_NO", 		"t_text", 		8,		85,		true);
//	GridObj.AddHeader("ALLSELECTED",		"전체선택",			"t_checkbox", 	2, 		80,		true);
      GridObj.AddHeader("SELECTED",		"선택",			"t_checkbox", 	2, 		80,		true);
      GridObj.AddHeader("ITEM_FLAG", 		"자재구분",		"t_combo", 		10, 	90,		true);
      GridObj.AddHeader("VENDOR_NAME", 	"제조회사",		"t_text", 		50, 	80,		true);
      GridObj.AddHeader("ITEM_CODE", 		"제품코드",		"t_imagetext", 	20, 	100,	false);
      GridObj.AddHeader("ITEM_NAME", 		"제품명", 		"t_text", 		500, 	150,	true);
      GridObj.AddHeader("SPECIFICATION", 	"규격", 			"t_text", 		256, 	200,	true);
      GridObj.AddHeader("UNIT", 			"단위",			"t_combo",		10, 	50,		true);
//	GridObj.AddHeader("PRICE", 			"출고가", 		"t_number", 	22.3, 	80,		true);
      GridObj.AddHeader("PRICE", 			"출고가", 		"t_number", 	-1, 	80,		true);
      GridObj.AddHeader("STOCK",			"재고량", 		"t_number", 	22,		60,		true);
      GridObj.AddHeader("ADD_DATE",		"등록일", 		"t_date", 		8,		85,		true);
      GridObj.AddHeader("CHANGE_DATE",	"수정일", 		"t_date", 		8,		85,		true);

      //AddHeader를 완료한 후 헤더를 그리드에 바인딩한다
      GridObj.BoundHeader();
//	GridObj.SetColHDCheckBoxVisible("SELECTED", true, false);

      //GridObj.SetColHDCheckBoxValue("SELECTED", true);

      // 스크롤 이동시에 툴팁에 보여줄 컬럼을 지
      GridObj.SetScrollTip("ITEM_NAME");


      //해당 컬럼을 숨긴다.
      GridObj.SetColHide("SEQ_NO", true);
//	GridObj.SetColHide("VENDOR_NAME", true);

      //t_combo 타입의 컬럼에 Combo List 를 추가한다.
      GridObj.AddComboListValue("ITEM_FLAG", "프로세서", "CPU");
      GridObj.AddComboListValue("ITEM_FLAG", "메모리", "MEM");
      GridObj.AddComboListValue("ITEM_FLAG", "메인보드", "MAB");
      GridObj.AddComboListValue("ITEM_FLAG", "그래픽카드", "VID");
      GridObj.AddComboListValue("ITEM_FLAG", "모니터", "MOR");
      GridObj.AddComboListValue("ITEM_FLAG", "하드디스크", "HDD");
      GridObj.AddComboListValue("ITEM_FLAG", "CDROM", "CDR");
      GridObj.AddComboListValue("ITEM_FLAG", "키보드", "KEY");
      GridObj.AddComboListValue("ITEM_FLAG", "마우스", "MOU");

      GridObj.AddComboListValue("UNIT", "EA", "EA");

      //이미지리스트에 이미지 URL을 추가한다
      //GridObj.AddImageList("ITEM_CODE", "/images/bt_search.gif");
      // WiseGrid에 전체 적용되는 이미지리스트에 이미지 URL을 추가 컬럼단위가 아닌 Grid가 ImageList를 가지고 사용하게 될 컬럼들을 지정할 수 있어동일한 ImageList를 사용하는 컬럼이 많아질 경우 통신 속도를 보완할 수 있음
      /*
       GridObj.AddGridImageList("/images/bt_search.gif");
       GridObj.SetColCellGridImageList("ITEM_NAME", true);
       GridObj.SetColCellGridImageList("ITEM_CODE", true);
       */


      //셀의 글자색을 적용한다.
      GridObj.SetColCellFgColor("ITEM_CODE", "0|0|255");

      //t_number 타입의 컬럼을 포맷타입으로  지정한다.
      GridObj.SetNumberFormat("PRICE", "#,##0.00");
//	GridObj.SetNumberFormat("PRICE", "#,#0.00#########################");
      GridObj.SetNumberFormat("STOCK", "#,###");

      //t_date 타입의 컬럼을 포맷타입으로  지정한다.
      GridObj.SetDateFormat("ADD_DATE", "yyyy/MM/dd");
      GridObj.SetDateFormat("CHANGE_DATE", "yyyy/MM/dd");

      //엑셀로 Export할때 상단에 헤더를 추가한다.
      GridObj.SetExcelHeader("기본예제", 20, 15, "center");

      //엑셀로 Export할때 하단에 Footer를 추가한다.
      GridObj.SetExcelFooter("Copyright 2014 UNIPOST CORP.", 15, 10, "right");

      GridObj.bNullValueNumberFormat=false;

    }

    /* 조회 */
    function doQuery() {
      var GridObj = document.WiseGrid;
      var servlet_url = "/servlet/wisegrid.sample.ExampleSelect";
      GridObj.SetParam("mode", "search");
      GridObj.SetParam("param1", "///asdad//");
      GridObj.SetParam("param2", "a1/2/3/1/3/");
      GridObj.SetParam("from_date",document.form.from_date.value);
      GridObj.SetParam("to_date",document.form.to_date.value);
      var to_time = getTime();
      GridObj.DoQuery(servlet_url,'SELECTED');
      var from_time = getTime();

    }


    /* 에러 지정된 규칙에 맞지않는 오류 */
    function error() {
      var GridObj = document.WiseGrid;
      var servlet_url = "/servlet/wisegrid.sample.ExampleSelect";
      GridObj.SetParam("mode", "error");
      GridObj.DoQuery(servlet_url,'SELECTED');
    }


    function getTime(){
      var d = new Date();
      return d.getTime();
    }


    /* 등록 */
    function doInsert() {
      var GridObj = document.WiseGrid;
      var servlet_url = "/servlet/wisegrid.sample.ExampleSelect";
      if(!chkSelected()) {
        alert("선택된 건이 없습니다.");
        return;
      }
      GridObj.SetParam("mode", "insert");
      GridObj.DoQuery(servlet_url, "SELECTED");
    }





    /* 수정 */
    function doUpdata() {
      var GridObj = document.WiseGrid;
      var servlet_url = "/servlet/wisegrid.sample.ExampleSelect";

      if(!chkSelected()) {
        alert("선택된 건이 없습니다.");
        return;
      }
      GridObj.SetParam("mode", "update");
      GridObj.DoQuery(servlet_url, "SELECTED");
    }

    /* 삭제 */
    function doDelete() {
      var GridObj = document.WiseGrid;
      var servlet_url = "/servlet/wisegrid.sample.ExampleSelect";
      if(!chkSelected()) {
        alert("선택된 건이 없습니다.");
        return;
      }
      GridObj.SetParam("mode", "delete");
      GridObj.DoQuery(servlet_url, "SELECTED");
    }

    /* 로우가 체크되었는지 확인한다. */
    function chkSelected() {
      var GridObj = document.WiseGrid;
      chkCount = 0;
      for(i = 0; i < GridObj.GetRowCount(); i++) {
        if(GridObj.GetCellValue("SELECTED", i) == "1")
          chkCount = chkCount + 1;
      }
      if(chkCount == 0) {
        return false;
      }
      return true;
    }

    /* 행 추가 */
    function doLineInsert() {
      var GridObj = document.WiseGrid;
      GridObj.AddRow();
      GridObj.SetCellValue("SELECTED",GridObj.GetActiveRowIndex(), "1");
      GridObj.SetCellImage('ITEM_CODE', GridObj.GetActiveRowIndex(), 0);
      GridObj.SetCellActivation("ITEM_CODE", GridObj.GetActiveRowIndex(), "edit");
    }

    /* EXCEL 내보내기 */
    function excelDown() {
      var GridObj = document.WiseGrid;
      GridObj.ExcelExport("", "", true, true);
    }

    /* WiseGrid의 셀의 내용이 변경되었을때 발생한다. */
    function GridChangeCell(strColumnKey, nRow) {
      var GridObj = document.WiseGrid;
      if(strColumnKey != "SELECTED") {
        GridObj.SetCellValue("SELECTED", nRow, "1");
      }
    }

    function GridEndQuery() {
      var GridObj = document.WiseGrid;
      var mode = GridObj.GetParam("mode");

//    if(mode == "error") alert(GridObj.GetMessage());

      if(mode == "search") {
        if(GridObj.GetStatus() == "true") {
          document.all.message.style.display="none";
          document.form.confirm.value =null;
        } else	{
          var error_msg = GridObj.GetMessage();
          alert(error_msg);
        }
      } else if(mode == "insert") {
        if(GridObj.GetStatus() == "true") {
          var insert_data = GridObj.GetParam("insert_data");
          document.all.message.style.display="";
          document.form.confirm.value = insert_data;
        } else	{
          var error_msg = GridObj.GetMessage();
          alert(error_msg);
        }
      } else if(mode == "update") {
        if(GridObj.GetStatus() == "true") {// 서버에서 전송한 상태코드를 가져온다.
          var update_data = GridObj.GetParam("update_data");
          document.all.message.style.display="";
          document.form.confirm.value = update_data;
        } else	{
          var error_msg = GridObj.GetMessage();
          alert(error_msg);
        }
      } else if(mode == "delete") {
        if(GridObj.GetStatus() == "true") {// 서버에서 전송한 상태코드를 가져온다.
          var delete_data = GridObj.GetParam("delete_data");
          document.all.message.style.display="";
          document.form.confirm.value = delete_data;
          for( i = 0 ; i < document.WiseGrid.GetRowCount(); i ++) {
            if(document.WiseGrid.GetCellValue('SELECTED',i) == 1) {
              document.WiseGrid.DeleteRow(i);
              i--;
            }
          }
        } else {
          var error_msg = GridObj.GetMessage();
          alert(error_msg);
        }
      }
    }

    function getdatetime() {
      var today = new Date();
      var year = today.getYear();
      var month = today.getMonth() + 1;
      var day = today.getDate();
      if(month < 10)
        month = "0" + month;

      if(day < 10)
        day = "0" + day;

      document.form.to_date.value = year + "" + month + "" + day;
    }

    function addFilter(){
      var grid = document.WiseGrid;
      grid.AddFilterCondition("ITEM_FLAG", "프로세서", "=", "and");
      grid.ApplyFilters();
    }

    function openModal() {

      var url = '/html/sample/example_save.htm';
      var popOptions = "dialogWidth: 2000px; dialogHeight: 1500px; center: yes; resizable: yes; status: no; scroll: no;";
      window.showModalDialog(url, window,  popOptions );
    }

  </script>
</head>
<%=OperateGridData.getVersion()%>
<body>
<form name="form">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr height="20">
      <td class="title1_k">
        &nbsp;기본예제<br><hr>
      </td>
    </tr>
    <tr height="20">
      <td class="title2_k">
        &nbsp;&nbsp;&nbsp; 기본
      </td>
    </tr>
  </table>
  <hr>
  <table width="98%" border="0" cellspacing="0" cellpadding="0"  class="title3">
    <tr>
      <table width="100%" border="0" cellpadding="2" cellspacing="0" >
        <tr>
          <td width="80">등록일</td>
          <td>
            <input type="text" name="from_date" size="8" value="20070101"> ~
            <input type="text" name="to_date" size="8" value="">
          </td>
          <td valign="top" align="right">
            <table border=0 cellpadding="0" cellspacing="0">
              <tr>
                <td><script language="javascript">btn("openModal()","모달창")</script></td>
                <!--<td><script language="javascript">btn("addFilter()","필터추가")</script></td>-->
                <td><script language="javascript">btn("doQuery()","조회")</script></td>
                <td><script language="javascript">btn("error()","전문오류")</script></td>
                <td><script language="javascript">btn("doInsert()","등록")</script></td>
                <td><script language="javascript">btn("doUpdata()","수정")</script></td>
                <td><script language="javascript">btn("doDelete()","삭제")</script></td>
                <td><script language="javascript">btn("doLineInsert()","행추가")</script></td>
                <td><script language="javascript">btn("excelDown()","EXCEL")</script></td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </tr>
  </table>
  <div id="ds"></div>
  <table width="100%" height="350" border="0" cellpadding="0" cellspacing="0" >
    <tr>
      <td bgcolor="#00455d" height="3"></td>
    </tr>
    <tr>
      <td align='left'>
        <script>initWiseGrid("WiseGrid", "100%", "350");</script>
      </td>
    </tr>
  </table>
  <br>
  <!-- 등록, 수정, 삭제가 실행되면 발생한다.-->
  <div id='message' style="display:none ">
    <fieldset s>
      <legend> [변경된 내용] </legend>
      <textarea name="confirm" cols="101" rows="8" style="border:0px" scrolling="auto"/>
    </fieldset>
  </div>
</form>
</body>
</html>
