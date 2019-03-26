library(mlegp)


### Name: print.gp
### Title: Gaussian Process Summary Information
### Aliases: print.gp
### Keywords: print methods

### ** Examples


x = -5:5; y1 = sin(x) + rnorm(length(x),sd=.1)
fit1 = mlegp(x, y1)
print(fit1)




