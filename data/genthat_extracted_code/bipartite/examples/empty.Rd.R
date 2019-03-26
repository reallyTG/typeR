library(bipartite)


### Name: empty
### Title: Deletes empty rows and columns from a matrix.
### Aliases: empty
### Keywords: package

### ** Examples

data(Safariland)
web <- Safariland
web[,5] <- 0
empty(web, count=TRUE)
attr(empty(web), "empty")




