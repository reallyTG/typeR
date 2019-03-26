library(ccaPP)


### Name: maxCorGrid
### Title: (Robust) maximum correlation via alternating series of grid
###   searches
### Aliases: maxCorGrid print.maxCor
### Keywords: multivariate robust

### ** Examples

data("diabetes")
x <- diabetes$x
y <- diabetes$y

## Spearman correlation
maxCorGrid(x, y, method = "spearman")
maxCorGrid(x, y, method = "spearman", consistent = TRUE)

## Pearson correlation
maxCorGrid(x, y, method = "pearson")



