library(ggformula)


### Name: gf_linerange
### Title: Formula interface to geom_linerange() and geom_pointrange()
### Aliases: gf_linerange gf_pointrange gf_linerangeh gf_pointrangeh

### ** Examples

gf_linerange()

if (require(mosaicData)) {
gf_ribbon(low_temp + high_temp ~ date, data = Weather,
          fill = ~ city, alpha = 0.4) %>%
   gf_theme(theme = theme_minimal())
gf_linerange(
  low_temp + high_temp ~ date | city ~ ., data = Weather,
  color = ~ ((low_temp + high_temp) / 2) ) %>%
  gf_refine(scale_colour_gradientn(colors = rev(rainbow(5)))) %>%
  gf_labs(color = "mid-temp")

gf_ribbon(low_temp + high_temp ~ date | city ~ ., data = Weather)

# Chaining in the data
Weather %>%
  gf_ribbon(low_temp + high_temp ~ date, alpha = 0.4) %>%
  gf_facet_grid(city ~ .)
}

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
 # width is defined differently for gf_boxplot() and gf_jitter()
 #   * for gf_boxplot() it is the full width of the box.
 #   * for gf_jitter() it is half that -- the maximum amount added or subtracted.
 gf_boxplot(age ~ substance, data = HELPrct, width = 0.4) %>%
   gf_jitter(width = 0.4, height = 0, color = "skyblue", alpha = 0.5)
 gf_boxplot(age ~ substance, data = HELPrct, width = 0.4) %>%
   gf_jitter(width = 0.2, height = 0, color = "skyblue", alpha = 0.5)
}
gf_linerangeh( date ~ low_temp + high_temp | ~ city, data = Weather,
  color = ~ avg_temp) %>%
  gf_refine(scale_color_viridis_c(begin = 0.1, end = 0.9, option = "C"))
gf_pointrangeh( date ~ avg_temp + low_temp + high_temp | ~ city, data = Weather,
  color = ~ avg_temp) %>%
  gf_refine(scale_color_viridis_c(begin = 0.1, end = 0.9, option = "C"))




