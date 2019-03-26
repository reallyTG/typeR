library(ggformula)


### Name: gf_boxploth
### Title: Formula interface to geom_boxploth()
### Aliases: gf_boxploth

### ** Examples

if (require(mosaicData)) {
  gf_boxploth(substance ~ age, data = HELPrct)
  gf_boxploth(substance ~ age, data = HELPrct, varwidth = TRUE)
  gf_boxploth(substance ~ age, data = HELPrct, color = ~ sex)
  gf_boxploth(substance ~ age, data = HELPrct, color = ~ sex, outlier.color = "gray50")
  # longer whiskers
  gf_boxploth(substance ~ age, data = HELPrct, color = ~ sex, coef = 2)
  # Note: height for boxplots is full width of box.
  #   For jittering, it is the half-height.
  gf_boxploth(substance ~ age | sex, data = HELPrct, coef = 5, height = 0.4) %>%
    gf_jitter(height = 0.2, alpha = 0.3)
  # move boxplots away a bit by adjusting dodge
  gf_boxploth(substance ~ age, data = HELPrct, color = ~ sex,
    position = position_dodgev(height = 0.9))
}



