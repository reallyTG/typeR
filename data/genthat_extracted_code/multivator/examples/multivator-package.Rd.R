library(multivator)


### Name: multivator-package
### Title: A multivariate emulator
### Aliases: multivator-package multivator
### Keywords: package

### ** Examples

data(mtoys)
d <- obs_maker(toy_mm, toy_mhp, toy_LoF, toy_beta)

ex <- experiment(toy_mm,d)

multem(toy_mm2, ex, toy_mhp, toy_LoF,give=TRUE)





