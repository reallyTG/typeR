library(RLumShiny)


### Name: popover
### Title: Create a bootstrap button with popover
### Aliases: popover

### ** Examples

# html code
popover("title", "Some content")

# example app
## Not run: 
##D shinyApp(
##D ui = fluidPage(
##D   jscolorInput(inputId = "col", label = "JSColor Picker", 
##D                value = "21BF6B", position = "right", 
##D                mode = "HVS", close = TRUE),
##D   popover(title = "Help!", content = "Call 911"),
##D   plotOutput("plot")
##D ),
##D server = function(input, output) {
##D   output$plot <- renderPlot({
##D     plot(cars, col = input$col, cex = 2, pch = 16)
##D  })
##D })
## End(Not run)



