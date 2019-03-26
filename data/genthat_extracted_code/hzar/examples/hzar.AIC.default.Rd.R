library(hzar)


### Name: hzar.AIC.default
### Title: Calculate the AIC score.
### Aliases: hzar.AIC.default hzar.AICc.default hzar.AIC.hzar.cline
###   hzar.AICc.hzar.cline hzar.AIC.hzar.dataGroup hzar.AICc.hzar.dataGroup

### ** Examples


print(hzar.AIC.default(-8,3))
print(hzar.AICc.default(-8,3,30))

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
print(hzar.AIC.hzar.dataGroup(hzar.fit2DataGroup(mknAdaAmodelFitR)))

mknAdaAcline <- hzar.gen.cline(list(center=300,width=10),
                               mknAdaAmodelFitR);

print(hzar.AIC.hzar.cline(mknAdaAcline));



