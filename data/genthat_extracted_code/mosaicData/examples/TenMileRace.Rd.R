library(mosaicData)


### Name: TenMileRace
### Title: Cherry Blossom Race
### Aliases: TenMileRace
### Keywords: datasets

### ** Examples

data(TenMileRace)
if (require(ggformula)) {
  gf_point(net ~ age | sex, data = TenMileRace, color = ~sex, alpha = 0.1) %>%
  gf_density2d(color = "gray40")
  lm(net ~ age + sex, data = TenMileRace)
}




