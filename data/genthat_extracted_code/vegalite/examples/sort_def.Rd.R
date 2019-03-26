library(vegalite)


### Name: sort_def
### Title: Create a sort definition object
### Aliases: sort_def

### ** Examples

vegalite() %>%
  add_data("https://vega.github.io/vega-editor/app/data/cars.json") %>%
  encode_x("Horsepower", type="quantitative", aggregate="mean") %>%
  encode_y("Origin", "ordinal", sort=sort_def("Horsepower", "mean")) %>%
  mark_bar()



