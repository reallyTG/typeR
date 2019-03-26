library(RSSampling)


### Name: regRSS
### Title: Regression estimator based on ranked set sampling
### Aliases: regRSS

### ** Examples

library("LearnBayes")
mu=c(1,12,2)
Sigma <- matrix(c(1,2,0,2,5,0.5,0,0.5,3), 3, 3)
x <- rmnorm(10000, mu, Sigma)
xx=as.numeric(x[,1])
xy=as.numeric(x[,2])
samplerss=con.rss(xx,xy,m=4,r=8,sets=FALSE,concomitant=TRUE)
sample.x=samplerss$sample.x
sample.y=samplerss$sample.y

regRSS(sample.x,sample.y,mu_Y=mean(xy))



