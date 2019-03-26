library(echarts4r)


### Name: e_lines
### Title: Lines
### Aliases: e_lines e_lines_

### ** Examples

flights <- read.csv(
  paste0("https://raw.githubusercontent.com/plotly/datasets/",
         "master/2011_february_aa_flight_paths.csv")
)

flights %>% 
  e_charts() %>% 
  e_geo() %>% 
  e_lines(
    start_lon, 
    start_lat, 
    end_lon, 
    end_lat,
    name = "flights",
    lineStyle = list(normal = list(curveness = 0.3))
   )




