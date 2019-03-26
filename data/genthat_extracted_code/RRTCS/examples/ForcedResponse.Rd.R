library(RRTCS)


### Name: ForcedResponse
### Title: Forced-Response model
### Aliases: ForcedResponse
### Keywords: Boruch Confidence_interval Estimation ForcedResponse
###   Qualitative Randomized_response Transformed_variable Variance

### ** Examples

data(ForcedResponseData)
dat=with(ForcedResponseData,data.frame(z,Pi))
p1=0.2
p2=0.2
cl=0.95
ForcedResponse(dat$z,p1,p2,dat$Pi,"total",cl)

#Forced Response with strata
data(ForcedResponseDataSt)
dat=with(ForcedResponseDataSt,data.frame(ST,z,Pi))
p1=0.2
p2=0.2
cl=0.95
ForcedResponse(dat$z,p1,p2,dat$Pi,"total",cl)



