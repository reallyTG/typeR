library(ggformula)


### Name: gf_density_2d
### Title: Formula interface to geom_density_2d()
### Aliases: gf_density_2d gf_density2d

### ** Examples

if (require(mosaicData)) {
  gf_jitter(avg_drinks ~ age, alpha = 0.2, data = HELPrct, width = 0.4, height = 0.4) %>%
  gf_density_2d(avg_drinks ~ age, data = HELPrct)
}
if (require(mosaicData)) {
  gf_jitter(avg_drinks ~ age, alpha = 0.2, data = HELPrct, width = 0.4, height = 0.4) %>%
  gf_density2d(avg_drinks ~ age, data = HELPrct)
}



