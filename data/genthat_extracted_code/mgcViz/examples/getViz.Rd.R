library(mgcViz)


### Name: getViz
### Title: Converting gam objects to gamViz objects
### Aliases: getViz

### ** Examples

library(mgcViz)
set.seed(2) ## simulate some data...
dat <- gamSim(1,n=1000,dist="normal",scale=2)
b <- gam(y~s(x0)+s(x1, x2)+s(x3), data=dat, method="REML")
b <- getViz(b, nsim = 20)
str(b$store$sim) # Simulated responses now stored here

plot(sm(b,1)) + l_fitLine() + l_ciLine() + l_rug() + l_points()
plot(sm(b,2)) + l_rug() + l_fitRaster() + l_fitContour()



