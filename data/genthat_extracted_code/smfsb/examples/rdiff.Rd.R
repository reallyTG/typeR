library(smfsb)


### Name: rdiff
### Title: Simulate a sample path from a univariate diffusion process
### Aliases: rdiff
### Keywords: smfsb

### ** Examples

# simulate a diffusion approximation to an immigration-death process
# infinitesimal mean
afun<-function(x,lambda,mu)
{
        lambda-mu*x
}
# infinitesimal standard deviation
bfun<-function(x,lambda,mu)
{
        sqrt(lambda+mu*x)
}
# plot a sample path
plot(rdiff(afun,bfun,lambda=1,mu=0.1,t=30))



