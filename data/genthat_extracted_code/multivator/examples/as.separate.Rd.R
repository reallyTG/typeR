library(multivator)


### Name: as.separate
### Title: Split an object of class 'experiment' into a list of univariate
###   datasets
### Aliases: as.separate

### ** Examples

require(emulator)

data(mtoys)
d <- obs_maker(toy_mm, toy_mhp, toy_LoF, toy_beta)

ex <- experiment(toy_mm, d)
jj <- as.separate(ex)   #list of 3: temp,rain,humidity


# now use it in a univariate emulator:
kk <- jj$temp
interpolant.quick(x=latin.hypercube(3,4),d=kk$obs,xold=kk$val,scales=rep(1,4))








