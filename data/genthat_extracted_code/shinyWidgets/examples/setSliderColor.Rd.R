library(shinyWidgets)


### Name: setSliderColor
### Title: Color editor for sliderInput
### Aliases: setSliderColor

### ** Examples

## Not run: 
##D 
##D if (interactive()) {
##D 
##D library(shiny)
##D library(shinyWidgets)
##D 
##D ui <- fluidPage(
##D 
##D   # only customize the 2 first sliders and the last one
##D   # the color of the third one is empty
##D   setSliderColor(c("DeepPink ", "#FF4500", "", "Teal"), c(1, 2, 4)),
##D   sliderInput("obs", "My pink slider:",
##D               min = 0, max = 100, value = 50
##D   ),
##D   sliderInput("obs2", "My orange slider:",
##D               min = 0, max = 100, value = 50
##D   ),
##D   sliderInput("obs3", "My basic slider:",
##D               min = 0, max = 100, value = 50
##D   ),
##D   sliderInput("obs3", "My teal slider:",
##D               min = 0, max = 100, value = 50
##D   ),
##D   plotOutput("distPlot")
##D )
##D 
##D server <- function(input, output) {
##D 
##D   output$distPlot <- renderPlot({
##D     hist(rnorm(input$obs))
##D   })
##D }
##D 
##D shinyApp(ui, server)
##D 
##D }
##D 
##D 
## End(Not run)



