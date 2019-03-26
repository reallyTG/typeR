library(shinyWidgets)


### Name: vertical-tab
### Title: Vertical tab panel
### Aliases: vertical-tab verticalTabsetPanel verticalTabPanel

### ** Examples

## Not run: 
##D 
##D if (interactive()) {
##D 
##D library(shiny)
##D library(shinyWidgets)
##D 
##D ui <- fluidPage(
##D   fluidRow(
##D     column(
##D       width = 10, offset = 1,
##D       tags$h2("Vertical tab panel example"),
##D       verticalTabsetPanel(
##D         verticalTabPanel(
##D           title = "Title 1", icon = icon("home", "fa-2x"),
##D           "Content panel 1"
##D         ),
##D         verticalTabPanel(
##D           title = "Title 2", icon = icon("map", "fa-2x"),
##D           "Content panel 2"
##D         ),
##D         verticalTabPanel(
##D           title = "Title 3", icon = icon("rocket", "fa-2x"),
##D           "Content panel 3"
##D         )
##D       )
##D     )
##D   )
##D )
##D 
##D server <- function(input, output, session) {
##D 
##D }
##D 
##D shinyApp(ui, server)
##D 
##D }
##D 
## End(Not run)



