library(shinyWidgets)


### Name: updateVerticalTabsetPanel
### Title: Update selected vertical tab
### Aliases: updateVerticalTabsetPanel

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
##D       tags$h2("Update vertical tab panel example:"),
##D       verbatimTextOutput("res"),
##D       radioButtons(
##D         inputId = "update", label = "Update selected:",
##D         choices = c("Title 1", "Title 2", "Title 3"),
##D         inline = TRUE
##D       ),
##D       verticalTabsetPanel(
##D         id = "TABS",
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
##D   output$res <- renderPrint(input$TABS)
##D   observeEvent(input$update, {
##D     shinyWidgets:::updateVerticalTabsetPanel(
##D       session = session,
##D       inputId = "TABS",
##D       selected = input$update
##D     )
##D   }, ignoreInit = TRUE)
##D }
##D 
##D shinyApp(ui, server)
##D 
##D }
##D 
## End(Not run)



