library(hzar)


### Name: hzar.model.addBoxReq
### Title: Add parameter restriction clauses to cline model
### Aliases: hzar.model.addBoxReq hzar.model.addCenterRange
###   hzar.model.addMaxCenter hzar.model.addMinCenter
###   hzar.model.addMaxDelta hzar.model.addMaxWidth
###   hzar.model.addMaxVariance hzar.model.addMuRange
###   hzar.model.addNormalBox

### ** Examples

data(manakinMolecular);
mknAdaA <-
  hzar.doMolecularData1DPops(manakinMolecular$distance,
                             manakinMolecular$ada.A,
                             manakinMolecular$ada.nSamples);
mknAdaAmodel <-
  hzar.makeCline1DFreq(mknAdaA, scaling="fixed",tails="none");
mknAdaAmodelB <-
  hzar.model.addBoxReq(mknAdaAmodel,-30,600);
mknAdaAmodel$req;
mknAdaAmodelB$req;



