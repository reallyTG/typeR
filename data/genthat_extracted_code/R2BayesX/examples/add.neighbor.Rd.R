library(R2BayesX)


### Name: add.neighbor
### Title: Add Neighborhood Relations
### Aliases: add.neighbor
### Keywords: spatial

### ** Examples

## read the graph file
file <- file.path(find.package("R2BayesX"), "examples", "Germany.gra")
germany <- read.gra(file)

## add some neighbors
get.neighbor(germany, c("1001", "7339"))
germany <- add.neighbor(germany, "7339", "1001")
get.neighbor(germany, c("1001", "7339"))



