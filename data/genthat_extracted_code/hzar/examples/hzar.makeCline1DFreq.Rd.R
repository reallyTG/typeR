library(hzar)


### Name: hzar.makeCline1DFreq
### Title: Make a cline model with the requested attributes.
### Aliases: hzar.makeCline1DFreq hzar.makeCline1DCLT
###   hzar.makeCline1DNormal clineMetaModel

### ** Examples

data(manakinMolecular);
mknAdaA <-
  hzar.doMolecularData1DPops(manakinMolecular$distance,
                             manakinMolecular$ada.A,
                             manakinMolecular$ada.nSamples);
mknAdaAmodel <-
  hzar.makeCline1DFreq(mknAdaA, scaling="fixed",tails="none");
str(mknAdaAmodel);



