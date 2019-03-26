library(mgcv)


### Name: rig
### Title: Generate inverse Gaussian random deviates
### Aliases: rig

### ** Examples

require(mgcv)
set.seed(7)
## An inverse.gaussian GAM example, by modify `gamSim' output... 
dat <- gamSim(1,n=400,dist="normal",scale=1)
dat$f <- dat$f/4 ## true linear predictor 
Ey <- exp(dat$f);scale <- .5 ## mean and GLM scale parameter
## simulate inverse Gaussian response...
dat$y <- rig(Ey,mean=Ey,scale=.2)
big <- gam(y~ s(x0)+ s(x1)+s(x2)+s(x3),family=inverse.gaussian(link=log),
          data=dat,method="REML")
plot(big,pages=1)
gam.check(big)
summary(big)



