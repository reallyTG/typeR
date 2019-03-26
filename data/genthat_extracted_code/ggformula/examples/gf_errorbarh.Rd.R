library(ggformula)


### Name: gf_errorbarh
### Title: Formula interface to geom_errorbarh()
### Aliases: gf_errorbarh

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

  gf_jitter(substance ~ age, data = HELPrct,
      alpha = 0.5, height = 0.2, width = 0, color = "skyblue") %>%
    gf_errorbarh( substance ~ lo + hi,  data = HELP2, inherit = FALSE) %>%
    gf_facet_grid( ~ sex)
  gf_jitter(age ~ substance, data = HELPrct,
      alpha = 0.5, width = 0.2, height = 0, color = "skyblue") %>%
    gf_errorbar( lo + hi ~ substance,  data = HELP2) %>%
    gf_facet_grid( ~ sex)
}



