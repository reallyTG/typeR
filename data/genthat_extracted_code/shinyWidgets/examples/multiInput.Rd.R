library(shinyWidgets)


### Name: multiInput
### Title: Create a multiselect input control
### Aliases: multiInput

### ** Examples

## Not run: 
##D ## Only run examples in interactive R sessions
##D if (interactive()) {
##D 
##D library("shiny")
##D library("shinyWidgets")
##D 
##D 
##D # simple use
##D 
##D ui <- fluidPage(
##D   multiInput(
##D     inputId = "id", label = "Fruits :",
##D     choices = c("Banana", "Blueberry", "Cherry",
##D                 "Coconut", "Grapefruit", "Kiwi",
##D                 "Lemon", "Lime", "Mango", "Orange",
##D                 "Papaya"),
##D     selected = "Banana", width = "350px"
##D   ),
##D   verbatimTextOutput(outputId = "res")
##D )
##D 
##D server <- function(input, output, session) {
##D   output$res <- renderPrint({
##D     input$id
##D   })
##D }
##D 
##D shinyApp(ui = ui, server = server)
##D 
##D 
##D # with options
##D 
##D ui <- fluidPage(
##D   multiInput(
##D     inputId = "id", label = "Fruits :",
##D     choices = c("Banana", "Blueberry", "Cherry",
##D                 "Coconut", "Grapefruit", "Kiwi",
##D                 "Lemon", "Lime", "Mango", "Orange",
##D                 "Papaya"),
##D     selected = "Banana", width = "400px",
##D     options = list(
##D       enable_search = FALSE,
##D       non_selected_header = "Choose between:",
##D       selected_header = "You have selected:"
##D     )
##D   ),
##D   verbatimTextOutput(outputId = "res")
##D )
##D 
##D server <- function(input, output, session) {
##D   output$res <- renderPrint({
##D     input$id
##D   })
##D }
##D 
##D shinyApp(ui = ui, server = server)
##D 
##D }
## End(Not run)



