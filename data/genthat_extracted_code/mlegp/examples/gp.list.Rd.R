library(mlegp)


### Name: gp.list
### Title: Gaussian Process Lists
### Aliases: gp.list
### Keywords: internal list models smooth ts

### ** Examples

  x = -5:5
  y1 = sin(x) + rnorm(length(x), sd=.1)
  y2 = sin(x) + rnorm(length(x), sd = .5)

  ## create the gp.list object ## 
  fitMulti = mlegp(x, cbind(y1,y2))

  plot(fitMulti)
 
  fitMulti   ## print summary of of the fitted Gaussian process list
  fitMulti[[2]]  ## print summary for the 2nd Gaussian process 




