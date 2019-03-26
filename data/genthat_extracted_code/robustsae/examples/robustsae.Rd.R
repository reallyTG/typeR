library(robustsae)


### Name: robustsae
### Title: Robust Small Area Estimation Modeling Both Means and Variances
### Aliases: robustsae
### Keywords: Hierarchical Bayes, Full Bayesian Analysis

### ** Examples

# If there is truemean data,
# load data set
data(BZdata)
attach(BZdata)

result <- robustsae(y ~ X1 + X2, S2, ni = BZdata$ni, nsim = 1000, burnin = 500, 
                      data = BZdata, truemean = truemean)
result

detach(BZdata)

# If there is no truemean data,
#load data set
data(corndata)
attach(corndata)

result2 <- robustsae(Xi ~ Z1i, Si^2, ni=corndata$ni, data = corndata) # no truemean
result2$mean
result2$variance

detach(corndata)



