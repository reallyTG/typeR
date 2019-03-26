library(mgcViz)


### Name: l_fitDens
### Title: Adding density strip of fitted effect
### Aliases: l_fitDens

### ** Examples

library(mgcViz)
set.seed(44)
dat <- gamSim(1,n=400,dist="normal",scale=2)
b <- gamV(y~s(x0)+x1+s(x2)+s(x3),data=dat)

plot(sm(b, 1)) + l_fitDens() + l_fitLine()
plot(pterm(b, 1)) + l_fitDens(trans = function(x) x^0.25) + l_fitLine()
               



