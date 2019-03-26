library(BayesX)


### Name: delete.neighbor
### Title: Delete Neighborhood Relations
### Aliases: delete.neighbor
### Keywords: spatial

### ** Examples

germany <- read.gra(system.file("examples/germany.gra", package="BayesX"))
get.neighbor(germany, c("7339"))
germany <- delete.neighbor(germany, "7339", "7141")
get.neighbor(germany, c("7339"))



