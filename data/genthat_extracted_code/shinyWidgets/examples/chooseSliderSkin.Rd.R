library(shinyWidgets)


### Name: chooseSliderSkin
### Title: Theme selector for sliderInput
### Aliases: chooseSliderSkin

### ** Examples

## Not run: 
##D 
##D if (interactive()) {
##D 
##D library(shiny)
##D library(shinyWidgets)
##D 
##D # With Modern design
##D 
##D ui <- fluidPage(
##D   chooseSliderSkin("Modern"),
##D   sliderInput("obs", "Customized single slider:",
##D               min = 0, max = 100, value = 50
##D   ),
##D   sliderInput("obs2", "Customized range slider:",
##D               min = 0, max = 100, value = c(40, 80)
##D   ),
##D   plotOutput("distPlot")
##D )
##D 
##D server <- function(input, output) {
##D 
##D   output$distPlot <- renderPlot({
##D     hist(rnorm(input$obs))
##D   })
##D 
##D }
##D 
##D shinyApp(ui, server)
##D 
##D 
##D 
##D # Use Flat design & a custom color
##D 
##D ui <- fluidPage(
##D   chooseSliderSkin("Flat", color = "#112446"),
##D   sliderInput("obs", "Customized single slider:",
##D               min = 0, max = 100, value = 50
##D   ),
##D   sliderInput("obs2", "Customized range slider:",
##D               min = 0, max = 100, value = c(40, 80)
##D   ),
##D   sliderInput("obs3", "An other slider:",
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



