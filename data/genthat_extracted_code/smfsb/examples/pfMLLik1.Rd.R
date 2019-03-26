library(smfsb)


### Name: pfMLLik1
### Title: Create a function for computing the log of an unbiased estimate
###   of marginal likelihood of a time course data set
### Aliases: pfMLLik1
### Keywords: smfsb

### ** Examples

noiseSD=5
# first simulate some data
truth=simTs(c(x1=50,x2=100),0,20,2,stepLVc)
data=truth+rnorm(prod(dim(truth)),0,noiseSD)
data=as.timedData(data)
# measurement error model
dataLik <- function(x,t,y,log=TRUE,...)
{
    ll=sum(dnorm(y,x,noiseSD,log=TRUE))
    if (log)
        return(ll)
    else
        return(exp(ll))
}
# now define a sampler for the prior on the initial state
simx0 <- function(N,t0,...)
{
    mat=cbind(rpois(N,50),rpois(N,100))
    colnames(mat)=c("x1","x2")
    mat
}
mLLik=pfMLLik1(1000,simx0,0,stepLVc,dataLik,data)
print(mLLik())
print(mLLik(th=c(th1 = 1, th2 = 0.005, th3 = 0.6)))
print(mLLik(th=c(th1 = 1, th2 = 0.005, th3 = 0.5)))



