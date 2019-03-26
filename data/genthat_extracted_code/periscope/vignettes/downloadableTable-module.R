## ---- eval=F-------------------------------------------------------------
#  # Inside ui_body.R or ui_sidebar.R
#  
#  downloadableTableUI("object_id1",
#                      downloadtypes = c("csv", "tsv"),
#                      hovertext = "Download the data here!",
#                      contentHeight = "300px",
#                      singleSelect = FALSE)

## ---- eval = F-----------------------------------------------------------
#  # Inside server_local.R
#  
#  selectedrows <- callModule(downloadableTable,
#                             "object_id1",
#                             logger = ss_userAction.Log,
#                             filenameroot = "mydownload1",
#                             downloaddatafxns = list(csv = mydatafxn1, tsv = mydatafxn2),
#                             tabledata = mydatafxn3,
#                             rownames = FALSE,
#                             caption = "This is a great table!  By: Me" )
#  
#  # selectedrows is the reactive return value, captured for later use

## ---- eval=F-------------------------------------------------------------
#  library(periscope)
#  
#  app_dir = tempdir()
#  create_new_application('mysampleapp', location = app_dir, sampleapp = TRUE)
#  runApp('mysampleapp', appDir = app_dir)

