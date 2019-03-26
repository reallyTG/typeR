library(RRTCS)


### Name: SoberanisCruz
### Title: SoberanisCruz model
### Aliases: SoberanisCruz
### Keywords: Confidence_interval Estimation Qualitative
###   Randomized_response SoberanisCruz Transformed_variable Variance

### ** Examples

data(SoberanisCruzData)
dat=with(SoberanisCruzData,data.frame(z,Pi))
p=0.7
alpha=0.5
cl=0.90
SoberanisCruz(dat$z,p,alpha,dat$Pi,"total",cl)



