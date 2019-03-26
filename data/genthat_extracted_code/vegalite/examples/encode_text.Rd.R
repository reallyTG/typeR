library(vegalite)


### Name: encode_text
### Title: Encode text "channel"
### Aliases: encode_text

### ** Examples

vegalite() %>%
  cell_size(300, 200) %>%
  add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
  encode_x("Horsepower", "quantitative") %>%
  encode_y("Miles_per_Gallon", "quantitative") %>%
  encode_color("Origin", "nominal") %>%
  calculate("OriginInitial", "datum.Origin[0]") %>%
  encode_text("OriginInitial", "nominal") %>%
  mark_text()



