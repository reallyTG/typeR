library(RSSampling)


### Name: con.Rrss
### Title: Selecting a robust ranked set sample with a concomitant variable
### Aliases: con.Rrss

### ** Examples

library("LearnBayes")
mu=c(1,12,2)
Sigma <- matrix(c(1,2,0,2,5,0.5,0,0.5,3), 3, 3)
x <- rmnorm(10000, mu, Sigma)
xx=as.numeric(x[,1])
xy=as.numeric(x[,3])

## Selecting robust ranked set samples
con.Rrss(xx,xy,m=8,r=4,type="l", sets=TRUE, concomitant=TRUE, alpha=0.3)
con.Rrss(xx,xy,m=5,r=2,type="re", sets=TRUE, concomitant=TRUE, alpha=0.2)
con.Rrss(xx,xy,m=6,r=3,type="tb", sets=TRUE, concomitant=TRUE, alpha=0.25)



