library(widgetframe)


### Name: frameableWidget
### Title: Adds pymjs initialization code to a htmlwidget.
### Aliases: frameableWidget

### ** Examples

## Not run: 
##D library(leaflet)
##D l <- leaflet() %>% addTiles() %>% setView(0,0,1)
##D htmlwidgets::saveWidget(
##D   widgetframe::frameableWidget(l),'some-directory-on-your-disk')
## End(Not run)



