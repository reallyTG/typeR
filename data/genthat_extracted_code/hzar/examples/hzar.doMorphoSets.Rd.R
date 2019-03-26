library(hzar)


### Name: hzar.doMorphoSets
### Title: Make hzar.obsData objects from scalar observations using
###   reference tables
### Aliases: hzar.doMorphoSets

### ** Examples

data(manakinMorphological);
data(manakinLocations);
mkn <-
  hzar.doMorphoSets("beard.length",
                    tDist=manakinLocations,
                    tDLocCol="LocalityID",
                    tDDistCol="distance",
                    tValues=manakinMorphological,
                    tVLocCol="Locality")
print(str(mkn));
hzar.plot.obsData(mkn$beard.length);



