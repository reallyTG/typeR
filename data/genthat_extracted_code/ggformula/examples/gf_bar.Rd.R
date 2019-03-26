library(ggformula)


### Name: gf_bar
### Title: Formula interface to geom_bar()
### Aliases: gf_bar gf_counts gf_props gf_percents gf_countsh gf_colh
###   gf_propsh gf_percentsh

### ** Examples

if (require(mosaicData)) {
  gf_bar( ~ substance, data = HELPrct)
  gf_bar( ~ substance, data = HELPrct, fill = ~ sex)
  gf_bar( ~ substance, data = HELPrct, fill = ~ sex, position = position_dodge())
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



