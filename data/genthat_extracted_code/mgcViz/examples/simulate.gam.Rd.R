library(mgcViz)


### Name: simulate.gam
### Title: Simulating responses from a GAM object
### Aliases: simulate.gam

### ** Examples

library(mgcViz)

set.seed(2) ## simulate some data... 
dat <- gamSim(1,n=400,dist="normal",scale=2)
b <- gam(y~s(x0)+s(x1)+s(x2)+s(x3),data=dat)

# Simulate three vectors of responses
matplot(t(simulate(b, nsim = 3)), pch = 19, col = c(1, 3, 4)) 




