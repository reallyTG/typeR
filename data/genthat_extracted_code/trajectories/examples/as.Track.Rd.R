library(trajectories)


### Name: as.Track
### Title: Converts data to an object of class "Track"
### Aliases: as.Track
### Keywords: ~kwd1 ~kwd2

### ** Examples

x <- runif(10,0,1)
y <- runif(10,0,1)
date <- seq(as.POSIXct("2015-1-1 0:00"), as.POSIXct("2015-1-1 9:00"), by = "hour")
Z <- as.Track(x,y,date)
plot(Z)



