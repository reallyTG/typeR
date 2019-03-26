library(echarts4r)


### Name: e_title
### Title: Title
### Aliases: e_title

### ** Examples

quakes %>% 
  dplyr::mutate(mag = exp(mag) / 60) %>% 
  e_charts(stations) %>% 
  e_scatter(depth, mag) %>% 
  e_visual_map(min = 3, max = 7) %>% 
  e_title("Quakes", "Stations and Magnitude")




