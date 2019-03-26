library(shinyWidgets)


### Name: downloadBttn
### Title: Create a download bttn
### Aliases: downloadBttn

### ** Examples

## Not run: 
##D 
##D if (interactive()) {
##D 
##D library(shiny)
##D library(shinyWidgets)
##D 
##D ui <- fluidPage(
##D   tags$h2("Download bttn"),
##D   downloadBttn(
##D     outputId = "downloadData",
##D     style = "bordered",
##D     color = "primary"
##D   )
##D )
##D 
##D server <- function(input, output, session) {
##D 
##D   output$downloadData <- downloadHandler(
##D     filename = function() {
##D       paste('data-', Sys.Date(), '.csv', sep='')
##D     },
##D     content = function(con) {
##D       write.csv(mtcars, con)
##D     }
##D   )
##D 
##D }
##D 
##D shinyApp(ui, server)
##D 
##D }
##D 
## End(Not run)



