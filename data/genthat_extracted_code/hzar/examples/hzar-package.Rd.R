library(hzar)


### Name: hzar-package
### Title: Hybrid Zone Analysis using R
### Aliases: hzar-package hzar
### Keywords: package

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
mknAdaAmodelFitR$mcmcParam$chainLength <- 2e3;
mknAdaAmodelFitR$mcmcParam$burnin <- 5e2;
mknAdaAmodelFit <- hzar.doFit(mknAdaAmodelFitR)
plot(hzar.mcmc.bindLL(mknAdaAmodelFit))
mknAdaAmodelData <-
  hzar.dataGroup.add(mknAdaAmodelFit);
## Not run: 
##D mknAdaAmodelData <-
##D   hzar.dataGroup.add(
##D     mknAdaAmodelData,
##D     hzar.chain.doSeq(hzar.next.fitRequest(mknAdaAmodelFit)));
##D hzar.plot.cline(mknAdaAmodelData);
##D hzar.plot.fzCline(mknAdaAmodelData);
## End(Not run)
print(hzar.getLLCutParam(mknAdaAmodelData,c("center","width")));
mknAdaAmodelNull <- hzar.dataGroup.null(mknAdaA);
mknAdaAdGs <- list(clineModel = mknAdaAmodelData,
                   nullModel  = mknAdaAmodelNull);
mknAdaAoDG <- hzar.make.obsDataGroup(mknAdaAdGs);
mknAdaAoDG <- hzar.copyModelLabels(mknAdaAdGs,mknAdaAoDG);
hzar.plot.cline(mknAdaAoDG);
print(hzar.AICc.hzar.obsDataGroup(mknAdaAoDG));




