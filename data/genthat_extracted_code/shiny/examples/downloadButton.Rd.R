library(shiny)


### Name: downloadButton
### Title: Create a download button or link
### Aliases: downloadButton downloadLink

### ** Examples

## Not run: 
##D # In server.R:
##D output$downloadData <- downloadHandler(
##D   filename = function() {
##D     paste('data-', Sys.Date(), '.csv', sep='')
##D   },
##D   content = function(con) {
##D     write.csv(data, con)
##D   }
##D )
##D 
##D # In ui.R:
##D downloadLink('downloadData', 'Download')
## End(Not run)




