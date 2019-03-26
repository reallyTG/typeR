library(periscope)


### Name: downloadableTableUI
### Title: DownloadableTable UI
### Aliases: downloadableTableUI

### ** Examples

# Inside ui_body.R or ui_sidebar.R
downloadableTableUI("object_id1", 
                    downloadtypes = c("csv", "tsv"), 
                    hovertext = "Download the data here!",
                    contentHeight = "300px",
                    singleSelect = FALSE)




