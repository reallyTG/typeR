library(hzar)


### Name: hzar.make.obsDataGroup
### Title: Collect optimizer output from multiple models for analysis.
### Aliases: hzar.make.obsDataGroup hzar.obsDataGroup

### ** Examples

data(manakinMolecular);
mknAdaA <-
  hzar.doMolecularData1DPops(manakinMolecular$distance,
                             manakinMolecular$ada.A,
                             manakinMolecular$ada.nSamples);
hzar.plot.obsData(mknAdaA);
mknAdaAmodel <-
  hzar.makeCline1DFreq(mknAdaA, scaling="fixed",tails="none");
mknAdaAmodel <-
  hzar.model.addBoxReq(mknAdaAmodel,-30,600);
mknAdaAmodelFitR <-
   hzar.first.fitRequest.old.ML(model=mknAdaAmodel ,
                                mknAdaA,
                                verbose=FALSE);
mknAdaAmodelFitR$mcmcParam$chainLength <- 5e3;
mknAdaAmodelFitR$mcmcParam$burnin <- 5e2;
mknAdaAmodelFit <- hzar.doFit(mknAdaAmodelFitR)
mknAdaAmodelData <-
  hzar.dataGroup.add(mknAdaAmodelFit);
## Not run: 
##D mknAdaAmodelFitL <-
##D     hzar.chain.doSeq(hzar.next.fitRequest(mknAdaAmodelFit), count=3);
## End(Not run)
mknAdaAmodelNull <- hzar.dataGroup.null(mknAdaA);
mknAdaAdGs <- list(clineModel = mknAdaAmodelData,
                   nullModel  = mknAdaAmodelNull);
mknAdaAoDG <- hzar.make.obsDataGroup(mknAdaAmodelFit);
## Not run: mknAdaAoDG <- hzar.make.obsDataGroup(mknAdaAmodelFitL,mknAdaAoDG);
mknAdaAoDG <- hzar.make.obsDataGroup(mknAdaAmodelNull,mknAdaAoDG);

mknAdaAoDG <- hzar.copyModelLabels(mknAdaAdGs,mknAdaAoDG);
hzar.plot.cline(mknAdaAoDG);
print(hzar.AICc.hzar.obsDataGroup(mknAdaAoDG));




