library(shinyWidgets)


### Name: toggleDropdownButton
### Title: Toggle a dropdown menu
### Aliases: toggleDropdownButton

### ** Examples

## Not run: 
##D 
##D if (interactive()) {
##D 
##D library("shiny")
##D library("shinyWidgets")
##D 
##D ui <- fluidPage(
##D   tags$h2("Toggle Dropdown Button"),
##D   br(),
##D   fluidRow(
##D     column(
##D       width = 6,
##D       dropdownButton(
##D         tags$h3("List of Inputs"),
##D         selectInput(inputId = 'xcol',
##D                     label = 'X Variable',
##D                     choices = names(iris)),
##D         sliderInput(inputId = 'clusters',
##D                     label = 'Cluster count',
##D                     value = 3,
##D                     min = 1,
##D                     max = 9),
##D         actionButton(inputId = "toggle2",
##D                      label = "Close dropdown"),
##D         circle = TRUE, status = "danger",
##D         inputId = "mydropdown",
##D         icon = icon("gear"), width = "300px"
##D       )
##D     ),
##D     column(
##D       width = 6,
##D       actionButton(inputId = "toggle1",
##D                    label = "Open dropdown")
##D     )
##D   )
##D )
##D 
##D server <- function(input, output, session) {
##D 
##D   observeEvent(list(input$toggle1, input$toggle2), {
##D     toggleDropdownButton(inputId = "mydropdown")
##D   }, ignoreInit = TRUE)
##D 
##D }
##D 
##D shinyApp(ui = ui, server = server)
##D 
##D }
##D 
##D 
## End(Not run)



