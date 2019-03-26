library(RSSampling)


### Name: con.Mrss
### Title: Selecting a ranked set sample (classical or modified) with a
###   concomitant variable
### Aliases: con.Mrss

### ** Examples

library("LearnBayes")
mu=c(1,12,2)
Sigma <- matrix(c(1,2,0,2,5,0.5,0,0.5,3), 3, 3)
x <- rmnorm(10000, mu, Sigma)
xx=as.numeric(x[,1])
xy=as.numeric(x[,3])

## Selecting modified ranked set samples
con.Mrss(xx, xy, m=5, r=3, type="r", concomitant=TRUE, sets=TRUE)
con.Mrss(xx, xy, m=4, r=7, type="m", concomitant=TRUE, sets=TRUE)
con.Mrss(xx, xy, m=5, r=2, type="e", concomitant=TRUE, sets=TRUE)
con.Mrss(xx, xy, m=8, r=3, type="p", concomitant=TRUE, sets=TRUE, p=0.25)
con.Mrss(xx, xy, m=6, r=5, type="bg", concomitant=TRUE, sets=TRUE)




