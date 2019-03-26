library(LearnBayes)


### Name: rtruncated
### Title: Simulates from a truncated probability distribution
### Aliases: rtruncated
### Keywords: models

### ** Examples

# want a sample of 10 from normal(2, 1) distribution truncated below by 3
n=10
lo=3
hi=Inf
rtruncated(n,lo,hi,pnorm,qnorm,mean=2,sd=1)
# want a sample of 20 from beta(2, 5) distribution truncated to (.3, .8)
n=20
lo=0.3
hi=0.8
rtruncated(n,lo,hi,pbeta,qbeta,2,5)



