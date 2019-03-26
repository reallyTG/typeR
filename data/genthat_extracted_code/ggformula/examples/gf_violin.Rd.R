library(ggformula)


### Name: gf_violin
### Title: Formula interface to geom_violin()
### Aliases: gf_violin gf_violinh

### ** Examples

if (require(mosaicData)) {
  gf_violin(age ~ substance, data = HELPrct)
  gf_violin(age ~ substance, data = HELPrct, fill = ~ sex)
}

if (require(mosaicData)) {
  gf_violinh(substance ~ age, data = HELPrct)
  gf_violinh(substance ~ age, data = HELPrct, fill = ~ sex)
}



