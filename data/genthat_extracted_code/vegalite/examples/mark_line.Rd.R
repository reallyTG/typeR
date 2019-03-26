library(vegalite)


### Name: mark_line
### Title: Line mark
### Aliases: mark_line

### ** Examples

vegalite() %>%
  cell_size(300, 300) %>%
  add_data("https://vega.github.io/vega-editor/app/data/driving.json") %>%
  encode_x("miles", "quantitative") %>%
  encode_y("gas", "quantitative") %>%
  encode_path("year", "temporal") %>%
  scale_x_linear(zero=FALSE) %>%
  scale_y_linear(zero=FALSE) %>%
  mark_line()



