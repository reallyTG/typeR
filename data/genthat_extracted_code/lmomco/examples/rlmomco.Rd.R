library(lmomco)


### Name: rlmomco
### Title: Random Variates of a Distribution
### Aliases: rlmomco
### Keywords: random variate quantile function The lmomco functions The
###   lmomco function mimics of R nomenclature

### ** Examples

lmr      <- lmoms(rnorm(20)) # generate 20 standard normal variates
para     <- parnor(lmr) # estimate parameters of the normal
simulate <- rlmomco(20,para) # simulate 20 samples using lmomco package

lmr  <- vec2lmom(c(1000,500,.3)) # first three lmoments are known
para <- lmom2par(lmr,type="gev") # est. parameters of GEV distribution
Q    <- rlmomco(45,para) # simulate 45 samples
PP   <- pp(Q)            # compute the plotting positions
plot(PP,sort(Q))         # plot the data up



