library(DAMOCLES)


### Name: DAMOCLES_ML
### Title: Maximization of the loglikelihood under the DAMOCLES model
### Aliases: DAMOCLES_ML
### Keywords: models

### ** Examples

data(NWPrimates_data)
out = DAMOCLES_ML(
   phy = NWPrimates_data[[1]],
   pa = NWPrimates_data[[2]],
   initparsopt = c(0.01,1.8),
   idparsopt = c(1,2),
   parsfix = c(0),
   idparsfix = c(3),
   pars2 = c(1E-3,1E-4,1E-5,1000),
   pchoice = 0)



