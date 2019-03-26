library(prabclus)


### Name: crmatrix
### Title: Region-wise cluster membership
### Aliases: crmatrix
### Keywords: spatial cluster

### ** Examples

## No test: 
  options(digits=3)
  data(kykladspecreg)
  data(nb)
  set.seed(1234)
  x <- prabinit(prabmatrix=kykladspecreg, neighborhood=nb)
  xc <- prabclust(x)

  crmatrix(x,xc)
  crmatrix(x,xc, percentages=TRUE)
## End(No test)



