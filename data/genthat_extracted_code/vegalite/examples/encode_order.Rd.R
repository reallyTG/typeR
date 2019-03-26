library(vegalite)


### Name: encode_order
### Title: Encode detail "order"
### Aliases: encode_order

### ** Examples

vegalite() %>%
  cell_size(200, 200) %>%
  add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
  encode_x("Horsepower", "quantitative") %>%
  encode_y("Miles_per_Gallon", "quantitative") %>%
  encode_color("Origin", "nominal") %>%
  encode_order("Origin", "ordinal", sort="descending") %>%
  mark_point()



