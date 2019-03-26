library(hzar)


### Name: hzar.gen.cline
### Title: Make a 'hzar.cline' object using the given parameters and model.
### Aliases: hzar.gen.cline

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
mknAdaAcline <- hzar.gen.cline(list(center=300,width=10),
                               mknAdaAmodelFitR);
str(mknAdaAcline);
hzar.plot.cline(mknAdaAmodelFitR);
hzar.plot.cline(mknAdaAcline,add=TRUE);





