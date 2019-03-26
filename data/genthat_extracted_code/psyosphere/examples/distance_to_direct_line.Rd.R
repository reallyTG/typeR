library(psyosphere)


### Name: distance_to_direct_line
### Title: Add deviation from shortest route from begin of track to a line
### Aliases: distance_to_direct_line

### ** Examples
## No test: 
# Get data
data(psyo_rounds2)

# Create finish line
finish <- data.frame(lon = c(6.851810,6.851000), lat = c(52.241800,52.240300))

# Plot tracks and finish
plot <- plot_tracks(psyo_rounds2, t_id = "")
plot_line(finish, plot = plot)

# Get deviation from shortest rout from begin to finish
psyo_rounds2 <- distance_to_direct_line(psyo_rounds2, finish)
## End(No test)


