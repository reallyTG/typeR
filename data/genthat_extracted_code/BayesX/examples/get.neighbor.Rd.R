library(BayesX)


### Name: get.neighbor
### Title: Obtain Neighbors of Given Regions
### Aliases: get.neighbor
### Keywords: spatial

### ** Examples

germany <- read.gra(system.file("examples/germany.gra", package="BayesX"))
get.neighbor(germany, "1001")
get.neighbor(germany, c("1001", "7339"))



