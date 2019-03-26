library(qlcVisualize)


### Name: dialects
### Title: Multiple correspondences of "f"-like sounds in German Dialects
### Aliases: dialects
### Keywords: datasets

### ** Examples

data(dialects)

require(mapdata)
map("worldHires", "Germany", fill = TRUE, col = "grey90")

lmap(dialects$villages, dialects$data[,21]
  , levels = c(0.20, 0.22, 0.24), add = TRUE, position = "topleft")

title(main = "f-sound in \'Kochlöffel\'")



