library(RRTCS)


### Name: Devore
### Title: Devore model
### Aliases: Devore
### Keywords: Confidence_interval Devore Estimation Qualitative
###   Randomized_response Transformed_variable Variance

### ** Examples

data(DevoreData)
dat=with(DevoreData,data.frame(z,Pi))
p=0.7
cl=0.95
Devore(dat$z,p,dat$Pi,"total",cl)



