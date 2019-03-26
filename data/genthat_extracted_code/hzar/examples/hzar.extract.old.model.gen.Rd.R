library(hzar)


### Name: hzar.extract.old.model.gen
### Title: Extract information about the clineMetaModel used.
### Aliases: hzar.extract.old.model.gen hzar.extract.old.model.req

### ** Examples


data(manakinMolecular);
ASdata <-
  hzar.doMolecularData1DPops(distance=manakinMolecular$distance,
                             pObs=manakinMolecular$ak2.A,
                             nEff=manakinMolecular$ak2.nSamples);
ASclineM <- hzar.makeCline1DFreq(data=ASdata,scaling="none", tails="none");
ASclineM$func;
ASclineM$req;
ASfitA <- hzar.first.fitRequest.old.ML(ASclineM,ASdata)
hzar.extract.old.model.gen(ASfitA)
hzar.extract.old.model.req(ASfitA)




