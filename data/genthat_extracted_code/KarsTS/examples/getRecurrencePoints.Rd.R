library(KarsTS)


### Name: getRecurrencePoints
### Title: A function to get recurrent points in a time series
### Aliases: getRecurrencePoints
### Keywords: ~kwd1 ~kwd2

### ** Examples


# # Generate time series
timSer <- genTSExample(stationary = FALSE, InKTSEnv = FALSE)
graphics::plot(timSer)

# # Calculate recurrence matrix
RP <- getRecurrencePoints(timSer, 1, 0, threshold = 0.1)
X <- RP$recPointsX
Y <- RP$recPointsY

# # Recurrence plot
LT <- nrow(timSer)
graphics::par(pty = "s")
# Upper triangle
graphics::plot(timSer$time[X], timSer$time[Y], cex = 0.3, col = 4, xlab = "", ylab = "")
# Lower triangle
graphics::points(timSer$time[Y], timSer$time[X], cex = 0.3, col = 4)
# Diagonal
graphics::points(1:LT, 1:LT, cex = 0.3, col = 4)

graphics::par(pty = "m")



