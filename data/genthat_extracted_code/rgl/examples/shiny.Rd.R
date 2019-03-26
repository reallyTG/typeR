library(rgl)


### Name: shiny
### Title: Functions for integration of 'rglwidget' into Shiny app.
### Aliases: rglwidgetOutput renderRglwidget playwidgetOutput
###   renderPlaywidget

### ** Examples

## Not run: 
##D # This could be used in a dynamic R Markdown document.  See
##D # demo("shinyDemo") and demo("simpleShinyRgl") for Shiny apps.
##D 
##D inputPanel(
##D   sliderInput("n", label = "n", min = 10, max = 100, value = 10, step = 10)
##D )
##D 
##D renderRglwidget({
##D     n <- input$n
##D     try(rgl.close())
##D     plot3d(rnorm(n), rnorm(n), rnorm(n))
##D     rglwidget()
##D   }, outputArgs = list(width = "auto", height = "300px"))
##D 
## End(Not run)



