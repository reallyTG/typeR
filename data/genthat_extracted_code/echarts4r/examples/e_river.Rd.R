library(echarts4r)


### Name: e_river
### Title: River
### Aliases: e_river e_river_

### ** Examples

dates <- seq.Date(Sys.Date() - 30, Sys.Date(), by = "day")

df <- data.frame(
  dates = dates,
  apples = runif(length(dates)),
  bananas = runif(length(dates)),
  pears = runif(length(dates))
)

df %>% 
  e_charts(dates) %>% 
  e_river(apples) %>% 
  e_river(bananas) %>% 
  e_river(pears) %>% 
  e_tooltip(trigger = "axis")




