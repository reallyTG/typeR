library(RRTCS)


### Name: Saha
### Title: Saha model
### Aliases: Saha
### Keywords: Confidence_interval Estimation Quantitative
###   Randomized_response Saha Transformed_variable Variance

### ** Examples

N=228
data(SahaData)
dat=with(SahaData,data.frame(z,Pi))
mu=c(1.5,5.5)
sigma=sqrt(c(1/12,81/12))
cl=0.95
Saha(dat$z,mu,sigma,dat$Pi,"mean",cl,N)



