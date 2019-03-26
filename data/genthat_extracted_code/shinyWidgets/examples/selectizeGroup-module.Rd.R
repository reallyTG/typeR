library(shinyWidgets)


### Name: selectizeGroup-module
### Title: Selectize Group
### Aliases: selectizeGroup-module selectizeGroupUI selectizeGroupServer

### ** Examples

## Not run: 
##D 
##D if (interactive()) {
##D 
##D library(shiny)
##D library(shinyWidgets)
##D 
##D data("mpg", package = "ggplot2")
##D 
##D ui <- fluidPage(
##D   fluidRow(
##D     column(
##D       width = 10, offset = 1,
##D       tags$h3("Filter data with selectize group"),
##D       panel(
##D         selectizeGroupUI(
##D           id = "my-filters",
##D           params = list(
##D             manufacturer = list(inputId = "manufacturer", title = "Manufacturer:"),
##D             model = list(inputId = "model", title = "Model:"),
##D             trans = list(inputId = "trans", title = "Trans:"),
##D             class = list(inputId = "class", title = "Class:")
##D           )
##D         ), status = "primary"
##D       ),
##D       dataTableOutput(outputId = "table")
##D     )
##D   )
##D )
##D 
##D server <- function(input, output, session) {
##D   res_mod <- callModule(
##D     module = selectizeGroupServer,
##D     id = "my-filters",
##D     data = mpg,
##D     vars = c("manufacturer", "model", "trans", "class")
##D   )
##D   output$table <- renderDataTable(res_mod())
##D }
##D 
##D shinyApp(ui, server)
##D 
##D }
##D 
## End(Not run)



