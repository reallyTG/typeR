library(ggplotAssist)


### Name: uiOutput3
### Title: Create side-by side uiOutput
### Aliases: uiOutput3

### ** Examples

library(shiny)
# Only run examples in interactive R sessions
if (interactive()) {
     ui <- fluidPage(
          textInput4("name","name",""),
          uiOutput3("test")
     )
     server <- function(input, output) {
          
     }
     shinyApp(ui, server)
}  



