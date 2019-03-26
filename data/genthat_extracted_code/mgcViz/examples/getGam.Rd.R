library(mgcViz)


### Name: getGam
### Title: Convert gamViz object to gamObject
### Aliases: getGam

### ** Examples

library(mgcViz)
set.seed(2) ## simulate some data...
dat <- gamSim(1,n=1000,dist="normal",scale=2)
b <- gam(y~s(x0)+s(x1, x2)+s(x3), data=dat, method="REML")
a <- getViz(b)
identical(b, getGam(a)) # Must be TRUE



