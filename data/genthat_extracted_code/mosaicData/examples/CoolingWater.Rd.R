library(mosaicData)


### Name: CoolingWater
### Title: CoolingWater
### Aliases: CoolingWater
### Keywords: datasets

### ** Examples

data(CoolingWater)
if (require(ggformula)) {
  gf_point(temp ~ time, data = CoolingWater, alpha = 0.5)
}




