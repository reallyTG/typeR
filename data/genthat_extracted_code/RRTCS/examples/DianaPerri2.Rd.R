library(RRTCS)


### Name: DianaPerri2
### Title: Diana-Perri-2 model
### Aliases: DianaPerri2
### Keywords: Confidence_interval DianaPerri Estimation Quantitative
###   Randomized_response Transformed_variable Variance

### ** Examples

N=100000
data(DianaPerri2Data)
dat=with(DianaPerri2Data,data.frame(z,Pi))
beta=0.8
mu=c(50/48,5/3)
cl=0.95
DianaPerri2(dat$z,mu,beta,dat$Pi,"mean",cl,N,"srswor")



