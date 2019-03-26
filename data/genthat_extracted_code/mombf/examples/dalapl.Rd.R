library(mombf)


### Name: dalapl
### Title: Density and random draws from the asymmetric Laplace
###   distribution
### Aliases: dalapl palapl ralapl
### Keywords: distribution

### ** Examples

library(mombf)
e <- ralapl(n=10^4, th=1, scale=2, alpha=0.5)
thseq <- seq(min(e),max(e),length=1000)
hist(e, main='', breaks=30, prob=TRUE)
lines(thseq, dalapl(thseq, th=1, scale=2, alpha=0.5), col=2)



