library(astrochron)


### Name: surrogateCor
### Title: Estimate correlation coefficient and significance for serially
###   correlated data
### Aliases: surrogateCor

### ** Examples

# generate two stochastic AR1 series
ex1 <- ar1(npts=100,dt=5)
ex2 <- ar1(npts=100,dt=6)

# calculate pearson correlation coefficient and p-value 
surrogateCor(ex1,ex2)



