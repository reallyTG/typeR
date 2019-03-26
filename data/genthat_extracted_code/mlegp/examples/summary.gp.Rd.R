library(mlegp)


### Name: summary.gp
### Title: Gaussian Process Summary Information
### Aliases: summary.gp
### Keywords: print methods

### ** Examples


## no replicates in the design matrix ##
x1 = -5:5; y1 = sin(x1) + rnorm(length(x1),sd=.1)
fit1 = mlegp(x1, y1)
summary(fit1)

## with replicates in the design matrix ##
x2 = kronecker(x1, rep(1,3)) 
y2 = sin(x2) + rnorm(length(x2), sd = .1)
fit2 = mlegp(x2,y2)
summary(fit2)




