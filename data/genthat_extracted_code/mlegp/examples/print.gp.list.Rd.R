library(mlegp)


### Name: print.gp.list
### Title: Gaussian Process List Summary Information
### Aliases: print.gp.list
### Keywords: print methods

### ** Examples

x = -5:5 
y1 = sin(x) + rnorm(length(x),sd=.1)
y2 = sin(x) + 2*x + rnorm(length(x), sd = .1)
fitMulti = mlegp(x, cbind(y1,y2))
print(fitMulti)  ## summary of the Gaussian process list
print(fitMulti, nums = 1:2) ## summary of Gaussian processes 1 and 2




