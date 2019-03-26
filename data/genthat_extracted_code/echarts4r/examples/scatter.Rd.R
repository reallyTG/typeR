library(echarts4r)


### Name: e_scatter
### Title: Scatter
### Aliases: e_scatter e_effect_scatter e_scatter_ e_effect_scatter_

### ** Examples

USArrests %>% 
  e_charts(Assault) %>% 
  e_scatter(Murder, Rape) %>% 
  e_effect_scatter(Rape, Murder, y.index = 1) %>% 
  e_grid(index = c(0, 1)) %>% 
  e_tooltip()

quakes %>% 
  e_charts(long) %>% 
  e_geo(
    roam = TRUE,
    boundingCoords = list(
      c(185, - 10),
      c(165, -40)
    )
  ) %>% 
  e_scatter(lat, mag, coord.system = "geo") %>% 
  e_visual_map(min = 4, max = 6.5)
  
# Calendar
year <- seq.Date(as.Date("2017-01-01"), as.Date("2017-12-31"), by = "day")
values <- rnorm(length(year), 20, 6)

year <- data.frame(year = year, values = values)

year %>% 
  e_charts(year) %>% 
  e_calendar(range = "2018") %>% 
  e_scatter(values, coord.system = "calendar") %>% 
  e_visual_map(max = 30)
  



