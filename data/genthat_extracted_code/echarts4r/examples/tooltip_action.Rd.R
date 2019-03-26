library(echarts4r)


### Name: tooltip_action
### Title: Show & Hide Tooltip
### Aliases: tooltip_action e_showtip e_hidetip

### ** Examples

cars %>% 
  e_charts(dist) %>% 
  e_scatter(speed) %>% 
  e_tooltip() %>% 
  e_hidetip(btn = "btn") %>% 
  e_button("btn", "Hide tooltip")




