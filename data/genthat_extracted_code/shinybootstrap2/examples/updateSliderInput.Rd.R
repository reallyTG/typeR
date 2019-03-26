library(shinybootstrap2)


### Name: updateSliderInput
### Title: Change the value of a slider input on the client
### Aliases: updateSliderInput

### ** Examples

## Not run: 
##D shinyServer(function(input, output, session) {
##D 
##D   observe({
##D     # We'll use the input$controller variable multiple times, so save it as x
##D     # for convenience.
##D     x <- input$controller
##D 
##D     # Similar to number and text. only label and value can be set for slider
##D     updateSliderInput(session, "inSlider",
##D       label = paste("Slider label", x),
##D       value = x)
##D 
##D     # For sliders that pick out a range, pass in a vector of 2 values.
##D     updateSliderInput(session, "inSlider2", value = c(x-1, x+1))
##D 
##D     # An NA means to not change that value (the low or high one)
##D     updateSliderInput(session, "inSlider3", value = c(NA, x+2))
##D   })
##D })
## End(Not run)



