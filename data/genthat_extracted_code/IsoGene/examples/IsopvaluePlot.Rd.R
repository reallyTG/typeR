library(IsoGene)


### Name: IsopvaluePlot
### Title: Plot of p-values from permutations under increasing or
###   decreasing alternatives
### Aliases: IsopvaluePlot
### Keywords: hplot

### ** Examples

x <- c(rep(1,3), rep(2,3), rep(3,3), rep(4,3))
y <- c(rnorm(3,1,1), rnorm(3,2,1), rnorm(3,3,1), rnorm(3,4,1)) 

IsopvaluePlot(x, y, niter = 1000, stat = "Williams")



