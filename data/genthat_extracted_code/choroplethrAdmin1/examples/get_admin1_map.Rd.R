library(choroplethrAdmin1)


### Name: get_admin1_map
### Title: Get an admin1 map for a country
### Aliases: get_admin1_map

### ** Examples

## Not run: 
##D  japan.map = get_admin1_map("japan")
##D 
##D  ggplot(japan.map, aes(long, lat, group=group)) + 
##D    geom_polygon() +
##D    ggtitle("An admin1 map of Japan")
## End(Not run)



