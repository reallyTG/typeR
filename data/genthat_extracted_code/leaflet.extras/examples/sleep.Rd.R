library(leaflet.extras)


### Name: suspendScroll
### Title: Prevents accidental map scrolling when scrolling in a document.
### Aliases: suspendScroll

### ** Examples

leaflet(width = "100%") %>%
  setView(0, 0, 1) %>%
  addTiles() %>%
  suspendScroll()



