library(RRTCS)


### Name: Warner
### Title: Warner model
### Aliases: Warner
### Keywords: Confidence_interval Estimation Qualitative
###   Randomized_response Transformed_variable Variance Warner

### ** Examples

N=802
data(WarnerData)
dat=with(WarnerData,data.frame(z,Pi))
p=0.7
cl=0.95
Warner(dat$z,p,dat$Pi,"total",cl)



