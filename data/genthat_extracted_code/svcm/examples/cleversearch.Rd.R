library(svcm)


### Name: cleversearch
### Title: Optimization over a parameter grid
### Aliases: cleversearch
### Keywords: optimize spatial

### ** Examples

simplefun <- function(vec) { return(sum(vec^2)) }
opt <- cleversearch(simplefun, c(-1, -1), c(1, 1), 51, logscale=FALSE)



