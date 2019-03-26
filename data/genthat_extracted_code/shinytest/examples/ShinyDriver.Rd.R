library(shinytest)


### Name: ShinyDriver
### Title: Class to manage a shiny app and a phantom.js headless browser
### Aliases: ShinyDriver

### ** Examples

## Not run: 
##D ## https://github.com/rstudio/shiny-examples/tree/master/050-kmeans-example
##D app <- ShinyDriver$new("050-kmeans-example")
##D expectUpdate(app, xcol = "Sepal.Width", output = "plot1")
##D expectUpdate(app, ycol = "Petal.Width", output = "plot1")
##D expectUpdate(app, clusters = 4, output = "plot1")
## End(Not run)



