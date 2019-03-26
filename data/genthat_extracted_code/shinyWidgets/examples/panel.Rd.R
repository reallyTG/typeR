library(shinyWidgets)


### Name: panel
### Title: Create a panel
### Aliases: panel

### ** Examples

## Not run: 
##D 
##D if (interactive()) {
##D library("shiny")
##D library("shinyWidgets")
##D 
##D ui <- fluidPage(
##D 
##D   # Default
##D   panel(
##D     "Content goes here",
##D     checkboxInput(inputId = "id1", label = "Label")
##D   ),
##D 
##D   # With header and footer
##D   panel(
##D     "Content goes here",
##D     checkboxInput(inputId = "id2", label = "Label"),
##D     heading = "My title",
##D     footer = "Something"
##D   ),
##D 
##D   # With status
##D   panel(
##D     "Content goes here",
##D     checkboxInput(inputId = "id3", label = "Label"),
##D     heading = "My title",
##D     status = "primary"
##D   )
##D )
##D 
##D server <- function(input, output, session) {
##D 
##D }
##D 
##D shinyApp(ui = ui, server = server)
##D }
##D 
## End(Not run)



