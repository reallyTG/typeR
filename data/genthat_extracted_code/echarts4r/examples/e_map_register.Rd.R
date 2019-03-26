library(echarts4r)


### Name: e_map_register
### Title: Register map
### Aliases: e_map_register

### ** Examples

## Not run: 
##D json <- jsonlite::read_json("http://www.echartsjs.com/gallery/data/asset/geo/USA.json")
##D 
##D USArrests %>%
##D   dplyr::mutate(states = row.names(.)) %>%
##D   e_charts(states) %>%
##D   e_map_register("USA", json) %>%
##D   e_map(Murder, map = "USA") %>% 
##D   e_visual_map(min = 0, max = 18)
## End(Not run)




