library(plotly)


### Name: plot_mapbox
### Title: Initiate a plotly-mapbox object
### Aliases: plot_mapbox

### ** Examples

## Not run: 
##D 
##D plot_mapbox(res_mn)
##D plot_mapbox(res_mn, color = ~INDRESNAME)
##D 
##D map_data("world", "canada") %>%
##D   group_by(group) %>%
##D   plot_mapbox(x = ~long, y = ~lat) %>%
##D   add_polygons() %>%
##D   layout(
##D     mapbox = list(
##D       center = list(lat = ~median(lat), lon = ~median(long))
##D     )
##D   )
## End(Not run)




