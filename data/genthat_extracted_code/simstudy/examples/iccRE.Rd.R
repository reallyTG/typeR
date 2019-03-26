library(simstudy)


### Name: iccRE
### Title: Generate variance for random effects that produce desired
###   intra-class coefficients (ICCs) for clustered data.
### Aliases: iccRE

### ** Examples

targetICC <- seq(0.05, 0.20, by = .01)

iccRE(targetICC, "poisson", lambda = 30)

iccRE(targetICC, "binary")

iccRE(targetICC, "normal", varTotal = 100)
iccRE(targetICC, "normal", varWithin = 100)

iccRE(targetICC, "gamma", disp = .5)




