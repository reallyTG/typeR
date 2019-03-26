library(RobustGaSP)


### Name: log_approx_ref_prior
### Title: The natural logarithm of the jointly robust prior (up to a
###   normalizing constant)
### Aliases: log_approx_ref_prior
### Keywords: internal

### ** Examples

# inputs
x<-runif(10);
n<-length(x);

# default prior parameters
a<-0.2
b<-n^{-1}*(a+1)
R0<-as.matrix(abs(outer(x,x, "-")))
CL<- mean(R0[which(R0>0)])

# compute the density of log reference prior up to a normalizing constant
param <- seq(-10,10,0.01)
prior <- rep(0,length(param))
for(i in 1:length(param)){
  prior[i] <- exp(log_approx_ref_prior(param[i],nugget=0,nugget_est=FALSE,CL,a,b) )
}
# plot
plot(param,prior,type='l',
                xlab='Logarithm of inverse range parameters',
                ylab='Prior density up to a normalizing constant')



