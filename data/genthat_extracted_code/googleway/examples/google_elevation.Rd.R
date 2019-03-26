library(googleway)


### Name: google_elevation
### Title: Google elevation
### Aliases: google_elevation

### ** Examples

## Not run: 
##D 
##D set_key("YOUR_GOOGLE_API_KEY")
##D ## elevation data for the MCG in Melbourne
##D df <- data.frame(lat = -37.81659,
##D                  lon = 144.9841)
##D 
##D google_elevation(df_locations = df,
##D                  simplify = TRUE)
##D 
##D 
##D 
##D ## elevation data from the MCG to the beach at Elwood (due south)
##D df <- data.frame(lat = c(-37.81659, -37.88950),
##D                  lon = c(144.9841, 144.9841))
##D 
##D df <- google_elevation(df_locations = df,
##D                        location_type = "path",
##D                        samples = 20,
##D                        simplify = TRUE)
##D 
##D ## plot results
##D library(ggplot2)
##D df_plot <- data.frame(elevation = df$results$elevation,
##D                        location = as.integer(rownames(df$results)))
##D 
##D ggplot(data = df_plot, aes(x = location, y = elevation)) +
##D  geom_line()
## End(Not run)





