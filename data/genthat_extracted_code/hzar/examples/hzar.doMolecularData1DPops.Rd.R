library(hzar)


### Name: hzar.doMolecularData1DPops
### Title: Generate a hzar.obsData object using summary data about each
###   locality
### Aliases: hzar.doMolecularData1DPops hzar.obsData hzar.doCLTData1DPops
###   hzar.doNormalData1DPops

### ** Examples

data(manakinMolecular);
mknAdaA <-
  hzar.doMolecularData1DPops(manakinMolecular$distance,
                             manakinMolecular$ada.A,
                             manakinMolecular$ada.nSamples);
print(str(mknAdaA));
hzar.plot.obsData(mknAdaA);



