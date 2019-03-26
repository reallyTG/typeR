library(RRTCS)


### Name: Eriksson
### Title: Eriksson model
### Aliases: Eriksson
### Keywords: Confidence_interval Eriksson Estimation Quantitative
###   Randomized_response Transformed_variable Variance

### ** Examples

N=53376
data(ErikssonData)
dat=with(ErikssonData,data.frame(z,Pi))
p=0.5
mu=mean(c(0,1,3,5,8))
sigma=sqrt(4/5*var(c(0,1,3,5,8)))
cl=0.95
Eriksson(dat$z,p,mu,sigma,dat$Pi,"mean",cl,N)



