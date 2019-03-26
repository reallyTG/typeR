library(trajr)


### Name: TrajSpeedIntervals
### Title: Calculate speed time intervals
### Aliases: TrajSpeedIntervals

### ** Examples

# Plot speed, highlighting intervals where speed drops below 50 units/sec
set.seed(4)
trj <- TrajGenerate(200, random = TRUE)
smoothed <- TrajSmoothSG(trj, 3, 101)
intervals <- TrajSpeedIntervals(smoothed, slowerThan = 50, fasterThan = NULL)
plot(intervals)

# Report the duration of the maximum period of low speed
cat(sprintf("Duration of the longest low-speed interval was %g secs\n", max(intervals$duration)))




