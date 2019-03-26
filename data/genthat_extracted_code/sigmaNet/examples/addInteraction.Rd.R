library(sigmaNet)


### Name: addInteraction
### Title: Modify the interactivity of a 'sigmaNet' object.
### Aliases: addInteraction

### ** Examples

library(igraph)
library(sigmaNet)
library(magrittr)

data(lesMis)

l <- layout_nicely(lesMis)
#change neighbor highlighting to on-hover, disable double-click zoom, enable mouse-wheel zoom
sig <- sigmaFromIgraph(graph = lesMis, layout = l) %>%
  addInteraction(neighborEvent = 'onHover', doubleClickZoom = FALSE, mouseWheelZoom = TRUE)
sig




