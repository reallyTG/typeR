library(dygraphs)


### Name: dyUnzoom
### Title: The dyUnzoom plugin adds an "Unzoom" button to the graph when
###   it's displaying in a zoomed state (this is a bit more discoverable
###   than the default double- click gesture for unzooming).
### Aliases: dyUnzoom

### ** Examples

library(dygraphs)
dygraph(ldeaths) %>%
  dyRangeSelector() %>%
  dyUnzoom()




