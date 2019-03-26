library(listviewer)


### Name: reactjson
### Title: Edit R Data with 'react-json'
### Aliases: reactjson

### ** Examples

## Not run: 
##D 
##D library(listviewer)
##D 
##D # use reactR for React dependencies
##D # devtools::install_github("timelyportfolio/reactR")
##D library(reactR)
##D 
##D reactjson()
##D 
##D reactjson(head(mtcars,4))
##D reactjson(I(jsonlite::toJSON(head(mtcars,5))))
##D 
##D library(shiny)
##D 
##D shinyApp(
##D   ui = reactjson(
##D     list(x=1,msg="react+r+shiny",opts=list(use_react=FALSE)),
##D     elementId = "json1"
##D   ),
##D   server = function(input, output, session){
##D     observeEvent(
##D       input$json1_change,
##D       str(input$json1_change)
##D     )
##D   }
##D )
##D 
##D 
##D # gadget to use as editor
##D library(miniUI)
##D ui <- miniUI::miniPage(
##D   miniUI::miniContentPanel(
##D     reactjson(
##D       list(x=1,msg="react+r+shiny",opts=list(use_react=FALSE)),
##D       elementId = "rjeditor"
##D     )
##D   ),
##D   miniUI::gadgetTitleBar(
##D     "Edit",
##D     right = miniUI::miniTitleBarButton("done", "Done", primary = TRUE)
##D   )
##D )
##D 
##D server <- function(input, output, session) {
##D   shiny::observeEvent(input$done, {
##D     shiny::stopApp(
##D       input$rjeditor_change
##D     )
##D   })
##D 
##D   shiny::observeEvent(input$cancel, { shiny::stopApp (NULL) })
##D }
##D 
##D runGadget(
##D   ui,
##D   server,
##D   viewer = shiny::paneViewer()
##D )
##D 
## End(Not run)



