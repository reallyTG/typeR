library(MachineShop)


### Name: ModelFrame
### Title: ModelFrame Class
### Aliases: ModelFrame ModelFrame.formula ModelFrame.matrix

### ** Examples

mf <- ModelFrame(ncases / (ncases + ncontrols) ~ agegp + tobgp + alcgp,
                 data = esoph, weights = ncases + ncontrols)
gbmfit <- fit(mf, model = GBMModel)
varimp(gbmfit)




