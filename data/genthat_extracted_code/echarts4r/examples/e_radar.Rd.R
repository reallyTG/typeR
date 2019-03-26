library(echarts4r)


### Name: e_radar
### Title: Radar
### Aliases: e_radar e_radar_

### ** Examples

df <- data.frame(
  x = LETTERS[1:5],
  y = runif(5, 1, 5),
  z = runif(5, 3, 7)
)

df %>% 
  e_charts(x) %>%  
  e_radar(y, max = 7) %>% 
  e_radar(z) %>% 
  e_tooltip(trigger = "item")




