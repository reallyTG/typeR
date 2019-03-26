library(geiger)


### Name: sim.char
### Title: simulate character evolution
### Aliases: sim.char
### Keywords: arith data

### ** Examples

geo <- get(data(geospiza))

## Continuous character -- univariate
usims <- sim.char(geo$phy, 0.02, 100)

## Use a simulated dataset in fitContinuous()
fitC <- fitContinuous(geo$phy, usims[,,1], model="BM", control=list(niter=10), ncores=2)

## Continuous character -- multivariate
s <- ratematrix(geo$phy, geo$dat)
csims <- sim.char(geo$phy, s, 100)

## Discrete character -- univariate
q <- list(rbind(c(-.5, .5), c(.5, -.5)))
dsims <- sim.char(geo$phy, q, model="discrete", n=10)

## Use a simulated dataset in fitDiscrete()
fitD <- fitDiscrete(geo$phy, dsims[,,1], model="ER", niter=10, ncores=2)

## Discrete character -- multivariate
qq <- list(rbind(c(-.5, .5), c(.5, -.5)), rbind(c(-.05, .05), c(.05, -.05)))
msims <- sim.char(geo$phy, qq, model="discrete", n=10)

  



