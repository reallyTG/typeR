library(NSM3)


### Name: svr.df
### Title: Susarla-van Ryzin
### Aliases: svr.df
### Keywords: Susarla van Ryzin

### ** Examples

hodgkins.affected<-matrix(c(1, 1, 1, 0, 1, 1, 0, 1, 0, 1, 1, 1, 1,0, 1, 1, 0, 1, 0, 1, 0, 1, 0,
0, 1, 346, 141, 296, 1953, 1375, 822, 2052, 836, 1910, 419,  107, 570, 312,1818, 364, 401, 1645,
330, 1540, 688, 1309, 505, 1378, 1446, 86),nrow=2,byrow=TRUE)
svr.df(hodgkins.affected[2,], hodgkins.affected[1,])



