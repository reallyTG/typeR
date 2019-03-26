library(mlegp)


### Name: plotObservedEffects
### Title: Plot Observed Values Vs. Each Dimension of the Design Matrix
### Aliases: plotObservedEffects plotObservedEffectsDefault
###   plotObservedEffects.gp
### Keywords: hplot methods

### ** Examples


## create the design and output matrices ##
x1 = kronecker(seq(0,1,by=.25), rep(1,5))
x2 = rep(seq(0,1,by=.25),5)
z = 4 * x1 - 2*x2 + x1 * x2 + rnorm(length(x1), sd = 0.001)

## look at the observed effects prior to fitting the GP ##
plotObservedEffects(cbind(x1,x2), z)

## fit the Gaussian process ##
fit = mlegp(cbind(x1,x2), z, param.names = c("x1", "x2"))

## look at the observed effects of the fitted GP (which are same as above)
plotObservedEffects(fit)




