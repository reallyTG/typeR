library(mosaicData)


### Name: Weather
### Title: Weather
### Aliases: Weather
### Keywords: datasets

### ** Examples

if (require(dplyr)) {
  Weather %>%
    group_by(city, year) %>%
    summarise(
      min_temp = min(low_temp),
      max_temp = max(high_temp)
      )
}

if (require(ggformula)) {
  Weather %>%
    gf_linerange(low_temp + high_temp ~ date | city ~ ., 
    color = ~ (high_temp + low_temp) / 2 ) %>%
    gf_refine(scale_color_gradientn(colors = rev(rainbow(5))))
}




