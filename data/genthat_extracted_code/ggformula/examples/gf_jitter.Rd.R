library(ggformula)


### Name: gf_jitter
### Title: Formula interface to geom_jitter()
### Aliases: gf_jitter

### ** Examples

gf_jitter()
if (require(mosaicData)) {
  # without jitter
  gf_point(age ~ sex, alpha = 0.25, data = HELPrct)
  # jitter only horizontally
  gf_jitter(age ~ sex, alpha = 0.25, data = HELPrct, width = 0.2, height = 0)
  # alternative way to get jitter
  gf_point(age ~ sex, alpha = 0.25, data = HELPrct,
    position = "jitter", width = 0.2, height = 0)
}



