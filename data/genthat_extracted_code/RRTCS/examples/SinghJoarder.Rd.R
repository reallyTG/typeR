library(RRTCS)


### Name: SinghJoarder
### Title: Singh-Joarder model
### Aliases: SinghJoarder
### Keywords: Confidence_interval Estimation Qualitative
###   Randomized_response SinghJoarder Transformed_variable Variance

### ** Examples

N=802
data(SinghJoarderData)
dat=with(SinghJoarderData,data.frame(z,Pi))
p=0.6
cl=0.95
SinghJoarder(dat$z,p,dat$Pi,"mean",cl,N)



