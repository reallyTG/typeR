library(hzar)


### Name: hzar.dataGroup.add
### Title: Prepare optimizer output for analysis.
### Aliases: hzar.dataGroup.add hzar.fit2DataGroup

### ** Examples

data(manakinMolecular);
mknAdaA <-
  hzar.doMolecularData1DPops(manakinMolecular$distance,
                             manakinMolecular$ada.A,
                             manakinMolecular$ada.nSamples);
mknAdaAmodel <-
  hzar.makeCline1DFreq(mknAdaA, scaling="fixed",tails="none");
mknAdaAmodel <-
  hzar.model.addBoxReq(mknAdaAmodel, -30, 600)
mknAdaAmodelFit <-
   hzar.first.fitRequest.old.ML(model=mknAdaAmodel ,
                                mknAdaA,
                                verbose=FALSE);
mknAdaAmodelFit$mcmcParam$chainLength <- 1e3;
mknAdaAmodelFit$mcmcParam$burnin <- 5e2;
mknAdaAFit <- hzar.doFit(mknAdaAmodelFit);
str(hzar.fit2DataGroup(mknAdaAFit));



