library(RRTCS)


### Name: DianaPerri1
### Title: Diana-Perri-1 model
### Aliases: DianaPerri1
### Keywords: Confidence_interval DianaPerri Estimation Quantitative
###   Randomized_response Transformed_variable Variance

### ** Examples

N=417
data(DianaPerri1Data)
dat=with(DianaPerri1Data,data.frame(z,Pi))
p=0.6
mu=c(5/3,5/3)
cl=0.95
DianaPerri1(dat$z,p,mu,dat$Pi,"mean",cl,N,"srswor")



