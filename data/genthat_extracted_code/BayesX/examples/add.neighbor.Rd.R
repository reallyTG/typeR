library(BayesX)


### Name: add.neighbor
### Title: Add Neighborhood Relations
### Aliases: add.neighbor
### Keywords: spatial

### ** Examples

germany <- read.gra(system.file("examples/germany.gra", package="BayesX"))
get.neighbor(germany, c("1001", "7339"))
germany <- add.neighbor(germany, "7339", "1001")
get.neighbor(germany, c("1001", "7339"))



