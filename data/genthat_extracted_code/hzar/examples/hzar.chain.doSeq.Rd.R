library(hzar)


### Name: hzar.chain.doSeq
### Title: Repeatedly run the optimizer in series to tune the optimizer.
### Aliases: hzar.chain.doSeq

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
mknAdaAmodelFit$mcmcParam$burnin <- 50;
mknAdaAmodelFit$mcmcParam$thin <- 10;
str(hzar.chain.doSeq(mknAdaAmodelFit, count=2));




