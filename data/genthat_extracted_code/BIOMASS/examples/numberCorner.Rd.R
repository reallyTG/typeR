library(BIOMASS)


### Name: numberCorner
### Title: Get the UTM coordinates with the corner of the plot
### Aliases: numberCorner

### ** Examples

coord <- data.frame(X = c(0, 200, 0, 200), Y = c(0, 0, 200, 200)) + 5000
plot <- rep("plot1", 4)
origin <- c(FALSE, FALSE, TRUE, FALSE)

# if you turn clock wise
corner <- numberCorner(projCoord = coord, plot = plot, origin = origin, clockWise = TRUE)

# Plot the plot
plot(coord, asp = 1)
text(coord, labels = corner$corner, pos = 1)


# Using a counterclockwise way
corner <- numberCorner(projCoord = coord, plot = plot, origin = origin, clockWise = FALSE)

# Plot the plot
plot(coord, asp = 1)
text(coord, labels = corner$corner, pos = 1)



