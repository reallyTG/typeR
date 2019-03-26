library(hzar)


### Name: hzar.mcmc.bindLL
### Title: Generate a mcmc object with sampled parameters and log
###   likelihoods.
### Aliases: hzar.mcmc.bindLL

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
mknAdaAmodelFit$mcmcParam$chainLength <- 5e3;
mknAdaAmodelFit$mcmcParam$burnin <- 5e2;
plot(hzar.mcmc.bindLL(hzar.doFit(mknAdaAmodelFit)));



