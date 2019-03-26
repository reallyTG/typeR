library(shiny)


### Name: reactiveFileReader
### Title: Reactive file reader
### Aliases: reactiveFileReader

### ** Examples

## Not run: 
##D # Per-session reactive file reader
##D function(input, output, session) {
##D   fileData <- reactiveFileReader(1000, session, 'data.csv', read.csv)
##D 
##D   output$data <- renderTable({
##D     fileData()
##D   })
##D }
##D 
##D # Cross-session reactive file reader. In this example, all sessions share
##D # the same reader, so read.csv only gets executed once no matter how many
##D # user sessions are connected.
##D fileData <- reactiveFileReader(1000, NULL, 'data.csv', read.csv)
##D function(input, output, session) {
##D   output$data <- renderTable({
##D     fileData()
##D   })
##D }
## End(Not run)



