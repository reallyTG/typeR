library(shiny.semantic)


### Name: dropdown
### Title: Create dropdown Semantic UI component
### Aliases: dropdown

### ** Examples

## Only run examples in interactive R sessions
if (interactive()) {

  library(shiny)
  library(shiny.semantic)
  ui <- function() {
      shinyUI(
        semanticPage(
          title = "Dropdown example",
          suppressDependencies("bootstrap"),
          uiOutput("dropdown"),
          p("Selected letter:"),
          textOutput("selected_letter")
       )
     )
  }
  server <- shinyServer(function(input, output) {
     output$dropdown <- renderUI({
         dropdown("simple_dropdown", LETTERS, value = "A")
     })
     output$selected_letter <- renderText(input[["simple_dropdown"]])
  })

  shinyApp(ui = ui(), server = server)
}




