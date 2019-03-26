library(mapdeck)


### Name: %>%
### Title: Pipe
### Aliases: %>%

### ** Examples

## No test: 

key <- "your_api_key"
mapdeck_map(key = key) %>%
add_scatterplot(
  data = capitals
  , lat = "lat"
  , lon = "lon"
  , radius = 100000
  , fill_colour = "country"
  , layer_id = "scatter_layer"
)
## End(No test)



