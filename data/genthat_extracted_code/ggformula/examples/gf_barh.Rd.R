library(ggformula)


### Name: gf_barh
### Title: Formula interface to geom_barh()
### Aliases: gf_barh

### ** Examples

if (require(mosaicData)) {
  gf_barh( ~ substance, data = HELPrct)
  gf_barh( ~ substance, data = HELPrct, fill = ~ sex)
  gf_barh( ~ substance, data = HELPrct, fill = ~ sex, position = position_dodge())
  # gf_counts() is another name for gf_bar()
  gf_counts( ~ substance, data = HELPrct, fill = ~ sex, position = position_dodge())
  # gf_props() and gf_percents() use proportions or percentages instead of counts
  gf_props( ~ substance, data = HELPrct, fill = ~ sex, position = position_dodge())
  gf_percents( ~ substance, data = HELPrct, fill = ~ sex, position = position_dodge())
  if (require(scales)) {
    gf_props( ~ substance, data = HELPrct, fill = ~ sex, position = position_dodge()) %>%
      gf_refine(scale_y_continuous(labels = scales::percent))
  }
}



