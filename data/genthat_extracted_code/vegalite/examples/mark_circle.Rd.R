library(vegalite)


### Name: mark_circle
### Title: Circle mark
### Aliases: mark_circle

### ** Examples

vegalite() %>%
  add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
  encode_x("Horsepower", "quantitative") %>%
  encode_y("Miles_per_Gallon", "quantitative") %>%
  mark_circle()



