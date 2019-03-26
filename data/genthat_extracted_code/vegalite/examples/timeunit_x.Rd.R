library(vegalite)


### Name: timeunit_x
### Title: How to encode x-axis time values
### Aliases: timeunit_x

### ** Examples

vegalite() %>%
  cell_size(300, 300) %>%
  add_data("https://vega.github.io/vega-editor/app/data/unemployment-across-industries.json") %>%
  encode_x("date", "temporal") %>%
  encode_y("count", "quantitative", aggregate="sum") %>%
  encode_color("series", "nominal") %>%
  scale_x_time(nice="month") %>%
  scale_color_nominal(range="category20b") %>%
  axis_x(axisWidth=0, format="%Y", labelAngle=0) %>%
  axis_y(remove=TRUE) %>%
  timeunit_x("yearmonth") %>%
  mark_area(stack="normalize")



