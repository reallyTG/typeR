library(ggformula)


### Name: gf_ribbon
### Title: Formula interface to geom_ribbon()
### Aliases: gf_ribbon

### ** Examples

gf_ribbon()

if (require(mosaicData)) {
gf_ribbon(low_temp + high_temp ~ date, data = Weather, fill = ~ city, alpha = 0.4) %>%
   gf_theme(theme = theme_minimal())
gf_linerange(
    low_temp + high_temp ~ date | city ~ ., color = ~ high_temp,
    data = Weather) %>%
  gf_refine(scale_colour_gradientn(colors = rev(rainbow(5))))
gf_ribbon(low_temp + high_temp ~ date | city ~ ., data = Weather)
# Chaining in the data
Weather %>% gf_ribbon(low_temp + high_temp ~ date, alpha = 0.4) %>%
  gf_facet_grid(city ~ .)
}



