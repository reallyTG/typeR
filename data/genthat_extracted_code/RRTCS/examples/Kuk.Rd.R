library(RRTCS)


### Name: Kuk
### Title: Kuk model
### Aliases: Kuk
### Keywords: Confidence_interval Estimation Kuk Qualitative
###   Randomized_response Transformed_variable Variance

### ** Examples

N=802
data(KukData)
dat=with(KukData,data.frame(z,Pi))
p1=0.6
p2=0.2
k=25
cl=0.95
Kuk(dat$z,p1,p2,k,dat$Pi,"mean",cl,N)



