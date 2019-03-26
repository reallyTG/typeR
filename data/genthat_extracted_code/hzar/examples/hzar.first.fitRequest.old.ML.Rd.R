library(hzar)


### Name: hzar.first.fitRequest.old.ML
### Title: Generate a ML based hzar.fitRequest using a meta model
###   structure.
### Aliases: hzar.first.fitRequest.old.ML hzar.first.fitRequest.gC

### ** Examples


data(manakinMolecular);
mknAdaA <-
  hzar.doMolecularData1DPops(manakinMolecular$distance,
                             manakinMolecular$ada.A,
                             manakinMolecular$ada.nSamples);
mknAdaAmodel <-
  hzar.makeCline1DFreq(mknAdaA, scaling="fixed",tails="none");
mknAdaAmodelFit <-
   hzar.first.fitRequest.old.ML(model=mknAdaAmodel ,
                                mknAdaA,
                                verbose=FALSE);
mknAdaAmodelFit$mcmcParam$chainLength <- 1e5;
str(mknAdaAmodelFit);



