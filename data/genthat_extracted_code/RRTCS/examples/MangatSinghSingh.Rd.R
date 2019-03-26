library(RRTCS)


### Name: MangatSinghSingh
### Title: Mangat-Singh-Singh model
### Aliases: MangatSinghSingh
### Keywords: Confidence_interval Estimation MangatSinghSingh Qualitative
###   Randomized_response Transformed_variable Variance

### ** Examples

data(MangatSinghSinghData)
dat=with(MangatSinghSinghData,data.frame(z,Pi))
p=0.6
alpha=0.5
cl=0.95
MangatSinghSingh(dat$z,p,alpha,dat$Pi,"total",cl)



