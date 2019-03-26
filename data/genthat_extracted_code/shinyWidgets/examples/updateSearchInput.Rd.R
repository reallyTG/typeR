library(shinyWidgets)


### Name: updateSearchInput
### Title: Change the value of a search input on the client
### Aliases: updateSearchInput

### ** Examples

## Not run: 
##D 
##D if (interactive()) {
##D 
##D library(shiny)
##D library(shinyWidgets)
##D 
##D ui <- fluidPage(
##D   tags$h2("Update searchinput"),
##D   searchInput(
##D     inputId = "search", label = "Enter your text",
##D     placeholder = "A placeholder",
##D     btnSearch = icon("search"),
##D     btnReset = icon("remove"),
##D     width = "450px"
##D   ),
##D   br(),
##D   verbatimTextOutput(outputId = "res"),
##D   br(),
##D   textInput(
##D     inputId = "update_search",
##D     label = "Update search"
##D   ),
##D   checkboxInput(
##D     inputId = "trigger_search",
##D     label = "Trigger update search",
##D     value = TRUE
##D   )
##D )
##D 
##D server <- function(input, output, session) {
##D 
##D   output$res <- renderPrint({
##D     input$search
##D   })
##D 
##D   observeEvent(input$update_search, {
##D     updateSearchInput(
##D       session = session,
##D       inputId = "search",
##D       value = input$update_search,
##D       trigger = input$trigger_search
##D     )
##D   }, ignoreInit = TRUE)
##D }
##D 
##D shinyApp(ui, server)
##D 
##D }
##D 
## End(Not run)



