library(ggformula)


### Name: gf_boxplot
### Title: Formula interface to geom_boxplot()
### Aliases: gf_boxplot

### ** Examples

if (require(mosaicData)) {
  gf_boxplot(age ~ substance, data = HELPrct)
  gf_boxplot(age ~ substance, data = HELPrct, varwidth = TRUE)
  gf_boxplot(age ~ substance, data = HELPrct, color = ~ sex)
  gf_boxplot(age ~ substance, data = HELPrct, color = ~ sex, outlier.color = "gray50")
  # longer whiskers
  gf_boxplot(age ~ substance, data = HELPrct, color = ~ sex, coef = 2)
  # Note: width for boxplots is full width of box.  For jittering, it is the
  # half-width.
  gf_boxplot(age ~ substance | sex, data = HELPrct, coef = 5, width = 0.4) %>%
    gf_jitter(width = 0.2, alpha = 0.3)
  # move boxplots away a bit by adjusting dodge
  gf_boxplot(age ~ substance, data = HELPrct, color = ~ sex, position = position_dodge(width = 0.9))
}



