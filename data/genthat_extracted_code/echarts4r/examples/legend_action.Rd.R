library(echarts4r)


### Name: legend_action
### Title: Legend
### Aliases: legend_action e_legend_select e_legend_unselect
###   e_legend_toggle_select e_legend_scroll

### ** Examples

e <- CO2 %>% 
  group_by(Type) %>% 
  e_charts(conc) %>% 
  e_scatter(uptake) 
  
e %>% 
  e_legend_unselect("Quebec")
  
e %>% 
  e_legend_unselect("Quebec", btn = "btn") %>% 
  e_button("btn", "Quebec")




