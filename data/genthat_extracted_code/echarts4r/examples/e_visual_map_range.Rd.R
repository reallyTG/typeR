library(echarts4r)


### Name: e_visual_map_range
### Title: Select Visual Map
### Aliases: e_visual_map_range

### ** Examples

data("state")

as.data.frame(state.x77) %>% 
  e_charts(Population) %>% 
  e_scatter(Income, Frost) %>% 
  e_visual_map(Frost, scale = e_scale) %>% 
  e_legend(FALSE) %>% 
  e_visual_map_range(
    selected = list(60, 120)
  )




