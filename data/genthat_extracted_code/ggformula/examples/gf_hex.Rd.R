library(ggformula)


### Name: gf_hex
### Title: Formula interface to geom_hex()
### Aliases: gf_hex

### ** Examples

if (require(mosaicData)) {
  gf_hex(avg_drinks ~ age, data = HELPrct, bins = 15) %>%
  gf_density2d(avg_drinks ~ age, data = HELPrct, color = "red", alpha = 0.5)
}



