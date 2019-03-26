library(maps)


### Name: identify.map
### Title: Identify regions on a map
### Aliases: identify.map
### Keywords: iplot

### ** Examples

identify(map("state", fill = TRUE, col = 0))
if(require(mapproj))
  identify(map("world", proj = "lagrange", fill = TRUE, col = 0, wrap=c(-180,180,-90)))



