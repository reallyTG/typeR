library(ggplotAssist)


### Name: selectizeInput3
### Title: side-by-side selectizeInput
### Aliases: selectizeInput3

### ** Examples

library(shiny)
# Only run examples in interactive R sessions
if (interactive()) {
  ui <- fluidPage(
         selectizeInput3("color", "color", choices=colors())
    )
    server <- function(input, output) {

    }
    shinyApp(ui, server)
}



