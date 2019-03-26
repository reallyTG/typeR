library(ggformula)


### Name: gf_errorbar
### Title: Formula interface to geom_errorbar()
### Aliases: gf_errorbar

### ** Examples

if (require(mosaicData) && require(dplyr)) {
HELP2 <- HELPrct %>%
  group_by(substance, sex) %>%
  summarise(
    mean.age = mean(age),
    median.age = median(age),
    max.age = max(age),
    min.age = min(age),
    sd.age = sd(age),
    lo = mean.age - sd.age,
    hi = mean.age + sd.age
    )

  gf_jitter(age ~ substance, data = HELPrct,
      alpha = 0.5, width = 0.2, height = 0, color = "skyblue") %>%
    gf_pointrange( mean.age + lo + hi ~ substance,  data = HELP2) %>%
    gf_facet_grid( ~ sex)
  gf_jitter(age ~ substance, data = HELPrct,
      alpha = 0.5, width = 0.2, height = 0, color = "skyblue") %>%
    gf_errorbar( lo + hi ~ substance,  data = HELP2) %>%
    gf_facet_grid( ~ sex)
  gf_jitter(age ~ substance, data = HELPrct,
      alpha = 0.5, width = 0.2, height = 0, color = "skyblue") %>%
    gf_boxplot( age ~ substance,  data = HELPrct, color = "red") %>%
    gf_crossbar( mean.age + lo + hi ~ substance,  data = HELP2) %>%
    gf_facet_grid( ~ sex)
}



