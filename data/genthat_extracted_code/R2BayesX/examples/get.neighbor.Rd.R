library(R2BayesX)


### Name: get.neighbor
### Title: Obtain Neighbors of Given Regions
### Aliases: get.neighbor
### Keywords: spatial

### ** Examples

file <- file.path(find.package("R2BayesX"), "examples", "Germany.gra")
germany <- read.gra(file)
get.neighbor(germany, "1001")
get.neighbor(germany, c("1001", "7339"))



