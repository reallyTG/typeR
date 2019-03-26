library(periscope)


### Name: downloadFileButton
### Title: DownloadFileButton UI
### Aliases: downloadFileButton

### ** Examples

# Inside ui_body.R or ui_sidebar.R

#single download type
downloadFileButton("object_id1", 
                   downloadtypes = c("csv"), 
                   hovertext = "Button 1 Tooltip")

#multiple download types
downloadFileButton("object_id2", 
                   downloadtypes = c("csv", "tsv"), 
                   hovertext = "Button 2 Tooltip")




