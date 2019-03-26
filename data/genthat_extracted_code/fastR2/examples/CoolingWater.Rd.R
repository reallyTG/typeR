library(fastR2)


### Name: CoolingWater
### Title: Cooling Water
### Aliases: CoolingWater CoolingWater1 CoolingWater2 CoolingWater3
###   CoolingWater4
### Keywords: datasets

### ** Examples

data(CoolingWater1)
data(CoolingWater2)
data(CoolingWater3)
data(CoolingWater4)
if (require(ggformula)) {
  gf_line(
    temp ~ time, color = ~ condition, 
    data = rbind(CoolingWater1, CoolingWater2))
}
if (require(ggformula)) {
  gf_line(
    temp ~ time, color = ~ condition, 
    data = rbind(CoolingWater3, CoolingWater4))
}




