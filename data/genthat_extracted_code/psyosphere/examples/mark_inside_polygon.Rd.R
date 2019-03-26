library(psyosphere)


### Name: mark_inside_polygon
### Title: Mark coordinates within a polygon
### Aliases: mark_inside_polygon

### ** Examples
## No test: 
# Create polygon
lon <- c(4.92, 4.93, 4.93, 4.92, 4.92)
lat <- c(52.311, 52.311, 52.308, 52.308, 52.311)
poly <- data.frame(lon, lat)
remove(lon, lat)

# Get data
data(psyo)

# Plot polygon and data
plot <- plot_tracks(psyo, t_id = "")
plot <- plot_polygon(poly, plot = plot)
plot

# Mark coordinates within plygon
psyo <- mark_inside_polygon(psyo, poly)

# Plot inside polygon in different color
in_poly <- psyo[ psyo[,"in_polygon"] != 0,]
in_poly[,"dot_color"] <- "red"
plot_tracks(in_poly, plot = plot)
## End(No test)


