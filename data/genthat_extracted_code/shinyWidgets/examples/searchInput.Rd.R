library(shinyWidgets)


### Name: searchInput
### Title: Search Input
### Aliases: searchInput

### ** Examples

## Not run: 
##D if (interactive()) {
##D   ui <- fluidPage(
##D     tags$h1("Search Input"),
##D     br(),
##D     searchInput(
##D       inputId = "search", label = "Enter your text",
##D       placeholder = "A placeholder",
##D       btnSearch = icon("search"),
##D       btnReset = icon("remove"),
##D       width = "450px"
##D     ),
##D     br(),
##D     verbatimTextOutput(outputId = "res")
##D   )
##D 
##D   server <- function(input, output, session) {
##D     output$res <- renderPrint({
##D       input$search
##D     })
##D   }
##D 
##D   shinyApp(ui = ui, server = server)
##D }
## End(Not run)




