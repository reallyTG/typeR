library(ggquiver)


### Name: geom_quiver
### Title: Quiver plots for ggplot2
### Aliases: geom_quiver GeomQuiver stat_quiver StatQuiver
### Keywords: datasets

### ** Examples

# Quiver plots of mathematical functions
expand.grid(x=seq(0,pi,pi/12), y=seq(0,pi,pi/12)) %>%
  ggplot(aes(x=x,y=y,u=cos(x),v=sin(y))) +
  geom_quiver()

# Removing automatic scaling
ggplot(seals, aes(x=long, y=lat, u=delta_long, v=delta_lat)) +
  geom_quiver(vecsize=NULL) +
  borders("state")

## Not run: 
##D # Centering arrows is useful for plotting on maps.
##D library(dplyr)
##D library(ggmap)
##D wind_data <- wind %>% filter(between(lon, -96, -93) & between(lat, 28.7, 30))
##D qmplot(lon, lat, data=wind_data, extent="panel", geom = "blank", zoom=8, maptype = "toner-lite") +
##D   geom_quiver(aes(u=delta_lon, v=delta_lat, colour = spd), center=TRUE)
## End(Not run)




