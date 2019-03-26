library(RSSampling)


### Name: mwwutestrss
### Title: Mann-Whitney-Wilcoxon test with RSS
### Aliases: mwwutestrss

### ** Examples

library("LearnBayes")
mu=c(1,1.2,2)
Sigma <- matrix(c(1,2,0,2,5,0.5,0,0.5,3), 3, 3)
x <- rmnorm(10000, mu, Sigma)
xx=as.numeric(x[,1])
xy=as.numeric(x[,2])
samplerss=con.rss(xx,xy,m=3,r=12,concomitant=TRUE)
sample.x=as.numeric(samplerss$sample.x)
sample.y=as.numeric(samplerss$sample.y)
mwwutestrss(sample.x,sample.y,m=3,r=12,l=3,n=12,delta0=0)
  


