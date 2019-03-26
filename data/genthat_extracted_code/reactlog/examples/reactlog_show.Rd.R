library(reactlog)


### Name: reactlog_render
### Title: Reactive Log Visualizer
### Aliases: reactlog_render reactlog_show

### ** Examples


## Not run: 
##D library(shiny)
##D library(reactlog)
##D 
##D # tell shiny to log reactivity
##D options("shiny.reactlog" = TRUE)
##D 
##D # run a shiny app
##D app <- system.file("examples/01_hello", package = "shiny")
##D runApp(app)
##D 
##D # once app has closed, display reactlog
##D shiny::showReactLog()
## End(Not run)



