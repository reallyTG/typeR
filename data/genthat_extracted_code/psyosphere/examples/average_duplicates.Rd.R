library(psyosphere)


### Name: average_duplicates
### Title: Correct coordinates with the same time
### Aliases: average_duplicates

### ** Examples
## No test: 
# Get data
data(psyo)
psyo <- psyo[c(1,15),]
psyo[2, c("time","id")] <- psyo[1, c("time","id")]

# Plot coordinates
map <- plot_map(psyo)
plot <- map + ggplot2::geom_point(data = psyo, size = 5)
plot <- plot_line(psyo[,c("lon", "lat")], plot = plot)
plot

# Calculate mean position
psyo <- average_duplicates(psyo)

# Plot mean position
plot + ggplot2::geom_point(data = psyo, size = 5)

## End(No test)


