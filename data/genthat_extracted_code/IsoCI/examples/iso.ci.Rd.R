library(IsoCI)


### Name: iso.ci
### Title: Calculate confidence intervals for cumulative distribution
###   function of current stuas failure times
### Aliases: iso.ci
### Keywords: confidenc intervals transformation bootstrap

### ** Examples

# simulating data


n <- 50
z <- rexp(n)
pz <- pexp(z)
d <- rbinom(n,1,pz)

# finding optimal bandwidth for estimationg a density function
h.opt = bandwidth.choose(h.set=seq(0.1,2,len=15),z=z,d=d)

# Untransforemd and transformed Wald-type confidence intervals
fit.wald <- iso.ci(z=z,d=d,h.opt=h.opt$h.opt)

# Bootstrap confidence intervals
## Not run: fit.bt <- iso.ci(z=z,d=d,method="bt",nboots=100) 

# Untransforemd and transformed bootstrap-Wald-type confidence intervals
## Not run: fit.bt.wald <- iso.ci(z=z,d=d,method="bt.wald",nboots=100)



