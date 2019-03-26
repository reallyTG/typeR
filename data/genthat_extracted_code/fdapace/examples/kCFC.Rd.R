library(fdapace)


### Name: kCFC
### Title: Functional clustering and identifying substructures of
###   longitudinal data using kCFC.
### Aliases: kCFC

### ** Examples

data(medfly25) 
Flies <- MakeFPCAInputs(medfly25$ID, medfly25$Days, medfly25$nEggs)
kcfcObj <- kCFC(Flies$Ly[1:250], Flies$Lt[1:250], # using only 250 for speed consideration 
                 optnsSW = list(methodMuCovEst = 'smooth', userBwCov = 2, FVEthreshold = 0.90),
                 optnsCS = list(methodMuCovEst = 'smooth', userBwCov = 2, FVEthreshold = 0.70))



