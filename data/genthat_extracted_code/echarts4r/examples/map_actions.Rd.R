library(echarts4r)


### Name: map_actions
### Title: Map Actions
### Aliases: map_actions e_map_select e_map_unselect e_map_toggle_select

### ** Examples

choropleth <- data.frame(
  countries = c(
    "France", "Brazil", "China", "Russia", "Canada", "India", "United States",
    "Argentina", "Australia"
  ),
  values = round(runif(9, 10, 25))
)

choropleth %>% 
  e_charts(countries) %>% 
  e_map(values) %>% 
  e_visual_map(min = 10, max = 25) %>% 
  e_map_toggle_select(name = "China", btn = "btn") %>% 
  e_button("btn", "Select China")




