library(trajr)


### Name: TrajSmoothSG
### Title: Smooth a trajectory using a Savitzky-Golay filter
### Aliases: TrajSmoothSG

### ** Examples

set.seed(3)
trj <- TrajGenerate(500, random = TRUE, angularErrorSd = .25)
smoothed <- TrajSmoothSG(trj, 3, 31)
plot(trj)
plot(smoothed, col = "red", add = TRUE)




