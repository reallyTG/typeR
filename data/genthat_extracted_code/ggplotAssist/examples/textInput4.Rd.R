library(ggplotAssist)


### Name: textInput4
### Title: Create side-by side textInput with disabled spell check
### Aliases: textInput4

### ** Examples

library(shiny)
# Only run examples in interactive R sessions
if (interactive()) {
     ui <- fluidPage(
          textInput4("id", "id", ""),
          textInput4("name","name","")
     )
     server <- function(input, output) {
          
     }
     shinyApp(ui, server)
}  



