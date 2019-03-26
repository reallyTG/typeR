library(editData)


### Name: selectInput3
### Title: Create a side-by-side selectInput
### Aliases: selectInput3

### ** Examples

library(shiny)
# Only run examples in interactive R sessions
if (interactive()) {
  ui <- fluidPage(
         selectInput3("sex", "sex", choices=c("Male","Female")),
         selectInput3("smoking", "smokingStatus", choices=c("Never","Ex-smoker","Smoker"))
    )
    server <- function(input, output) {

    }
    shinyApp(ui, server)
}



