library(ggformula)


### Name: gf_area
### Title: Formula interface to geom_area()
### Aliases: gf_area

### ** Examples

if (require(dplyr) && require(mosaicData)) {
  Temps <- Weather %>%
    filter(city == "Chicago", year == 2016, month <= 4)
  gf_linerange(low_temp + high_temp  ~ date, color = ~ high_temp, data = Temps)
  gf_ribbon(low_temp + high_temp ~ date, data = Temps, color = "navy", alpha = 0.3)
  gf_area(high_temp ~ date, data = Temps, color = "navy", alpha = 0.3)

  gf_ribbon(low_temp + high_temp ~ date, data = Weather, alpha = 0.3) %>%
    gf_facet_grid(city ~ .)

  gf_linerange(low_temp + high_temp ~ date, color = ~ high_temp, data = Weather) %>%
    gf_facet_grid(city ~ .) %>%
    gf_refine(scale_colour_gradientn(colors = rev(rainbow(5))))
}




