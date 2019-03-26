library(vegalite)


### Name: mark_tick
### Title: Tick mark
### Aliases: mark_tick

### ** Examples

vegalite() %>%
  add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
  encode_x("Horsepower", "quantitative") %>%
  encode_y("Cylinders", "ordinal") %>%
  mark_tick()



