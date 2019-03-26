library(htmlwidgets)


### Name: onStaticRenderComplete
### Title: Execute JavaScript code after static render
### Aliases: onStaticRenderComplete

### ** Examples

## Not run: 
##D library(leaflet)
##D library(htmltools)
##D library(htmlwidgets)
##D 
##D page <- tagList(
##D   leaflet() %>% addTiles(),
##D   onStaticRenderComplete(
##D     "HTMLWidgets.find('.leaflet').setZoom(4);"
##D   )
##D )
##D print(page, browse = TRUE)
## End(Not run)




