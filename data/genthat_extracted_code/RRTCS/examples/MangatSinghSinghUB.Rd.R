library(RRTCS)


### Name: MangatSinghSinghUB
### Title: Mangat-Singh-Singh-UB model
### Aliases: MangatSinghSinghUB
### Keywords: Confidence_interval Estimation MangatSinghSingh Qualitative
###   Randomized_response Transformed_variable Variance

### ** Examples

N=802
data(MangatSinghSinghUBData)
dat=with(MangatSinghSinghUBData,data.frame(I,J,Pi))
p1=0.6
p2=0.8
cl=0.95
MangatSinghSinghUB(dat$I,dat$J,p1,p2,dat$Pi,"mean",cl,N)



