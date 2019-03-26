library(lsbclust)


### Name: dcars
### Title: Dutch Cars Data
### Aliases: dcars

### ** Examples

data("dcars")
set.seed(5448)
m <- lsbclust(data = dcars, delta = c(1, 1, 1, 1), nclust = c(5, 3, 6, 8), nstart = 5, 
              nstart.kmeans = 10, parallel = FALSE, fixed = "columns")



