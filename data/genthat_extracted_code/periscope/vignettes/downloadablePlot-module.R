## ---- eval=F-------------------------------------------------------------
#  # Inside ui_body.R or ui_sidebar.R
#  
#  downloadablePlotUI("object_id1",
#                     downloadtypes = c("png", "csv"),
#                     download_hovertext = "Download the plot and data here!",
#                     height = "500px",
#                     btn_halign = "left")

## ---- eval = F-----------------------------------------------------------
#  # Inside server_local.R
#  
#  callModule(downloadablePlot,
#             "object_id1",
#             logger = ss_userAction.Log,
#             filenameroot = "mydownload1",
#             aspectratio = 1.33,
#             downloadfxns = list(png = myplotfxn, tsv = mydatafxn),
#             visibleplot = myplotfxn)

