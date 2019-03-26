library(psyosphere)


### Name: plot_polygon
### Title: Plot polygon on map
### Aliases: plot_polygon

### ** Examples
## No test: 
lon <- c(6.849975, 6.849627, 6.850001, 6.850350, 6.849975)
lat <- c(52.241745, 52.241100, 52.241004, 52.241649, 52.241745)
polygon <- data.frame(lon, lat)
remove(lon, lat)

plot <- plot_polygon(polygon)
plot
## End(No test)


