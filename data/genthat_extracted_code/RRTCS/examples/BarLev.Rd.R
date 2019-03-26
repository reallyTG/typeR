library(RRTCS)


### Name: BarLev
### Title: BarLev model
### Aliases: BarLev
### Keywords: BarLev Confidence_interval Estimation Quantitative
###   Randomized_response Transformed_variable Variance

### ** Examples

data(BarLevData)
dat=with(BarLevData,data.frame(z,Pi))
p=0.6
mu=1
sigma=1
cl=0.95
BarLev(dat$z,p,mu,sigma,dat$Pi,"total",cl)



