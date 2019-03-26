library(ggplotAssist)


### Name: textAreaInput4
### Title: Create side-by side textAreaInput with disabled spell check
### Aliases: textAreaInput4

### ** Examples

library(shiny)
# Only run examples in interactive R sessions
if (interactive()) {
     ui <- fluidPage(
          textAreaInput4("Code","Code","")
     )
     server <- function(input, output) {
          
     }
     shinyApp(ui, server)
}  



