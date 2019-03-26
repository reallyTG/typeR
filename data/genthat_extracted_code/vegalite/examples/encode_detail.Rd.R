library(vegalite)


### Name: encode_detail
### Title: Encode detail "channel"
### Aliases: encode_detail

### ** Examples

vegalite() %>%
  cell_size(200, 200) %>%
  add_data("https://vega.github.io/vega-editor/app/data/stocks.csv") %>%
  encode_x("date", "temporal") %>%
  encode_y("price", "quantitative") %>%
  encode_detail("symbol", "nominal") %>%
  mark_line()



