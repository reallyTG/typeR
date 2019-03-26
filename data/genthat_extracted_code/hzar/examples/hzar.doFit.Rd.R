library(hzar)


### Name: hzar.doFit
### Title: Run the optimizer.
### Aliases: hzar.doFit

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
   hzar.first.fitRequest.old.ML(model=mknAdaAmodel,
                                mknAdaA,
                                verbose=FALSE);
mknAdaAmodelFit$mcmcParam$chainLength <- 5e3;
mknAdaAmodelFit$mcmcParam$burnin <- 1e2;
str(hzar.doFit(mknAdaAmodelFit));



