library(spatstat)


### Name: as.interact
### Title: Extract Interaction Structure
### Aliases: as.interact as.interact.fii as.interact.interact
###   as.interact.ppm
### Keywords: spatial models

### ** Examples

   data(cells)
   model <- ppm(cells, ~1, Strauss(0.07))
   f <- as.interact(model)
   f



