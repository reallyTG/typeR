library(PPCI)


### Name: ncutdr
### Title: Minimum Normalised Cut Dimension Reduction
### Aliases: ncutdr
### Keywords: file

### ** Examples

### not run
run = FALSE
if(run){
  ## load optidigits dataset
  data(optidigits)

  ## find nine dimensional projection (one fewer than
  ## the number of clusters, as is common in clustering)
  sol <- ncutdr(optidigits$x, 9)

  ## visualise the solution via the first 3 pairs of dimensions
  plot(sol, pairs = 3, labels = optidigits$c)

  ## compare with PCA projection
  pairs(optidigits$x%*%eigen(cov(optidigits$x))$vectors[,1:3], col = optidigits$c)
  }



