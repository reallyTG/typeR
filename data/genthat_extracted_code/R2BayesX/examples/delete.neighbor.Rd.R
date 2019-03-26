library(R2BayesX)


### Name: delete.neighbor
### Title: Delete Neighborhood Relations
### Aliases: delete.neighbor
### Keywords: spatial

### ** Examples

## read the graph file
file <- file.path(find.package("R2BayesX"), "examples", "Germany.gra")
germany <- read.gra(file)

## delete some neighbors
get.neighbor(germany, c("7339"))
germany <- delete.neighbor(germany, "7339", "7141")
get.neighbor(germany, c("7339"))



