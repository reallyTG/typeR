library(echarts4r)


### Name: e_geo
### Title: Geo
### Aliases: e_geo

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




