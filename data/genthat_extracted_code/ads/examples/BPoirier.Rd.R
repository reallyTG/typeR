library(ads)


### Name: BPoirier
### Title: Tree spatial pattern in Beau Poirier plot, Haye forest, France
### Aliases: BPoirier
### Keywords: datasets

### ** Examples

data(BPoirier)
BP.spp <- spp(BPoirier$trees, mark=BPoirier$species, window=BPoirier$rect)
plot(BP.spp)



