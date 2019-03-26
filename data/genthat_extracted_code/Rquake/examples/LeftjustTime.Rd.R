library(Rquake)


### Name: LeftjustTime
### Title: Adjust times relative to least minute.
### Aliases: LeftjustTime
### Keywords: misc

### ** Examples


set.seed(0)

d1  = list(yr=rep(2005, 4), jd=rep(5, 4), hr=rep(6, 4), mi=c(1,1,2,3), sec=runif(4, 0, 60))
LeftjustTime(d1)




