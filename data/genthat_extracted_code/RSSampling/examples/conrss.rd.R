library(RSSampling)


### Name: con.rss
### Title: Selecting ranked set sample with a concomitant variable
### Aliases: con.rss

### ** Examples

library("LearnBayes")
mu=c(1,12,2)
Sigma <- matrix(c(1,2,0,2,5,0.5,0,0.5,3), 3, 3)
x <- rmnorm(10000, mu, Sigma)
xx=as.numeric(x[,1])
xy=as.numeric(x[,3])
con.rss(xx, xy, m=3, r=4, sets=TRUE, concomitant=TRUE)




