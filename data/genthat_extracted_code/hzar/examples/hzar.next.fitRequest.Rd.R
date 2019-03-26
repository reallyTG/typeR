library(hzar)


### Name: hzar.next.fitRequest
### Title: Generate a new fitRequest using data from another fitRequest.
### Aliases: hzar.next.fitRequest

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

mknAdaAmodelFit$mcmcParam$chainLength <- 1e4;
str(hzar.next.fitRequest(mknAdaAmodelFit))
## Not run: 
##D mknAdaAinitialFit <- hzar.doFit(mknAdaAmodelFit);
##D str(hzar.next.fitRequest(mknAdaAinitialFit))
## End(Not run)



