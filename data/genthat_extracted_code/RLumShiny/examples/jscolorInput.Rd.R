library(RLumShiny)


### Name: jscolorInput
### Title: Create a JSColor picker input widget
### Aliases: jscolorInput

### ** Examples

# html code
jscolorInput("col", "Color", "21BF6B", slider = FALSE)

# example app
## Not run: 
##D shinyApp(
##D ui = fluidPage(
##D   jscolorInput(inputId = "col", label = "JSColor Picker", 
##D                value = "21BF6B", position = "right", 
##D                mode = "HVS", close = TRUE),
##D   plotOutput("plot")
##D ),
##D server = function(input, output) {
##D   output$plot <- renderPlot({
##D     plot(cars, col = input$col, cex = 2, pch = 16)
##D  })
##D })
## End(Not run)



