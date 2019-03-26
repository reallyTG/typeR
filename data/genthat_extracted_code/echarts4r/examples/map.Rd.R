library(echarts4r)


### Name: e_map
### Title: Choropleth
### Aliases: e_map e_map_ e_map_3d e_map_3d_

### ** Examples

## Not run: 
##D choropleth <- data.frame(
##D   countries = c("France", "Brazil", "China", "Russia", "Canada", "India", "United States",
##D                 "Argentina", "Australia"),
##D   values = round(runif(9, 10, 25))
##D )
##D 
##D choropleth %>% 
##D   e_charts(countries) %>% 
##D   e_map(values) %>% 
##D   e_visual_map(min = 10, max = 25)
##D 
##D choropleth %>% 
##D   e_charts(countries) %>% 
##D   e_map_3d(values, shading = "lambert") %>% 
##D   e_visual_map(min = 10, max = 30)
## End(Not run)




