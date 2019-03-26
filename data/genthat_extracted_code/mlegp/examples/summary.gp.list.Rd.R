library(mlegp)


### Name: summary.gp.list
### Title: Gaussian Process List Summary Information
### Aliases: summary.gp.list
### Keywords: print methods

### ** Examples

x = -5:5 
y1 = sin(x) + rnorm(length(x),sd=.1)
y2 = sin(x) + 2*x + rnorm(length(x), sd = .1)
fitMulti = mlegp(x, cbind(y1,y2))
summary(fitMulti)  ## summary of the Gaussian process list
summary(fitMulti, nums = 1:2) ## summary of Gaussian processes 1 and 2



