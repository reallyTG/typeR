library(rgl)


### Name: sceneChange
### Title: Make large change to a scene from Shiny
### Aliases: sceneChange registerSceneChange

### ** Examples

## Not run: 
##D shinyUI(fluidPage(
##D   registerSceneChange(),
##D   actionButton("thebutton", "Change")
##D ))
##D 
##D shinyServer(function(input, output, session) {
##D   observeEvent(input$thebutton, {
##D     session$sendCustomMessage("sceneChange",
##D       sceneChange("thewidget", delete = deletes, add = adds))
##D   })
##D })
## End(Not run)



