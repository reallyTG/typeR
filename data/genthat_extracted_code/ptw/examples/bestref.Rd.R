library(ptw)


### Name: bestref
### Title: Identification of optimal reference
### Aliases: bestref
### Keywords: manip

### ** Examples

data(gaschrom)
bestref(gaschrom)
bestref(gaschrom, optim.crit = "WCC", trwdth = 50)
bestref(gaschrom, optim.crit = "RMS")
bestref(gaschrom, optim.crit = "RMS", smooth.param = 1e5)



