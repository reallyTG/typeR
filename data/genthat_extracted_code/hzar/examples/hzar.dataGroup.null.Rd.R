library(hzar)


### Name: hzar.dataGroup.null
### Title: Datagroup placeholder for the null model (frequency independent
###   of location)
### Aliases: hzar.dataGroup.null

### ** Examples

data(manakinMolecular);
mknAdaA <-
  hzar.doMolecularData1DPops(manakinMolecular$distance,
                             manakinMolecular$ada.A,
                             manakinMolecular$ada.nSamples);
mkn.AdaA.null <- hzar.dataGroup.null(mknAdaA)
hzar.plot.cline(mkn.AdaA.null);



