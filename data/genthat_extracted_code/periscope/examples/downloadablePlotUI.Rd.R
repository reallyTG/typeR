library(periscope)


### Name: downloadablePlotUI
### Title: DownloadablePlot UI
### Aliases: downloadablePlotUI

### ** Examples

# Inside ui_body.R or ui_sidebar.R
downloadablePlotUI("object_id1", 
                   downloadtypes = c("png", "csv"), 
                   download_hovertext = "Download the plot and data here!",
                   height = "500px", 
                   btn_halign = "left")




