library(psyosphere)


### Name: distance_peers
### Title: Add distance to peers
### Aliases: distance_peers

### ** Examples
## No test: 
# Simple example ---------------------------------------------------------------
data(psyo_rounds2)
time <- as.POSIXct("2015-09-03 13:51:07")
tracks <- psyo_rounds2[ psyo_rounds2[,"time"] == time, ]
tracks <- distance_peers(tracks)

# Example with intersect position ----------------------------------------------

#  p1 --------x-------> p2
#             ^
#             |
#             |
#            p3

# We have two tracks. From track 1 we have p1 and p2 at a certain time. From
# tracks 2 we have point 3. Point 3 has a time between p1 and p2. We want to
# know what the distance from point 3 is to track 1 at the time of point 3. For
# this we need determine point x.

# Create the points
p1 <- data.frame(time = "2016-01-01 01:00:00", lon = 0, lat = 0, id = "1")
p2 <- data.frame(time = "2016-01-01 03:00:00", lon = 2, lat = 0, id = "1")
p3 <- data.frame(time = "2016-01-01 02:00:00", lon = 1, lat = 1, id = "2")
p1$time <- as.POSIXct(p1$time)
p2$time <- as.POSIXct(p2$time)
p3$time <- as.POSIXct(p3$time)

# Combine into a track
tracks <- rbind(p1, p2, p3)

# Get point x for illustration
x <- psyosphere:::timed_destination_point_private(p1, p2, p3, "id")

# Plot points as track for illustration
plot <- plot_tracks(tracks)
plot

# Add x to plot for illustration
plot_tracks(x, plot = plot)

# Get distances
tracks <- distance_peers(tracks)
## End(No test)


