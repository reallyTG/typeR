library(lsbclust)


### Name: lov
### Title: List-of-values Data Set
### Aliases: lov

### ** Examples

data("lov")

## Construct array
lovarr <- indarr(lov[, 1:9], maxcat = 9)

## Run analysis
set.seed(13841)
fit <- lsbclust(data = lovarr, margin = 3, delta = c(0, 1, 0, 0), nclust = c(NA, 11, NA, 5), 
                 fixed = "rows", nstart = 1, iter.max = 50, nstart.kmeans = 10)



