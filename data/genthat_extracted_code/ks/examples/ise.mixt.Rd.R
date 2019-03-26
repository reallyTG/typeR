library(ks)


### Name: ise.mixt
### Title: Squared error bandwidth matrix selectors for normal mixture
###   densities
### Aliases: Hmise.mixt Hamise.mixt Hmise.mixt.diag Hamise.mixt.diag
###   hmise.mixt hamise.mixt ise.mixt amise.mixt mise.mixt
### Keywords: smooth

### ** Examples

x <- rmvnorm.mixt(100)
Hamise.mixt(samp=nrow(x), mus=rep(0,2), Sigmas=var(x), props=1, deriv.order=1)



