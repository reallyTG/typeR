library(RRTCS)


### Name: MangatSingh
### Title: Mangat-Singh model
### Aliases: MangatSingh
### Keywords: Confidence_interval Estimation MangatSingh Qualitative
###   Randomized_response Transformed_variable Variance

### ** Examples

N=802
data(MangatSinghData)
dat=with(MangatSinghData,data.frame(z,Pi))
p=0.7
t=0.55
cl=0.95
MangatSingh(dat$z,p,t,dat$Pi,"mean",cl,N)



