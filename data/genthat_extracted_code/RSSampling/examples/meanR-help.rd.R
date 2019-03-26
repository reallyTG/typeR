library(RSSampling)


### Name: meanRSS
### Title: Mean estimation based on ranked set sampling
### Aliases: meanRSS

### ** Examples

library("LearnBayes")
mu=c(1,12,2)
Sigma <- matrix(c(1,2,0,2,5,0.5,0,0.5,3), 3, 3)
x <- rmnorm(10000, mu, Sigma)
xx=as.numeric(x[,1])
xy=as.numeric(x[,2])
samplerss=con.Mrss(xx,xy,m=4,r=8,type="r",sets=FALSE,concomitant=FALSE)$sample.x

## mean estimation, confidence interval and hypothesis testing for ranked set sample
meanRSS(samplerss,m=4,r=8,mu_0=1)




