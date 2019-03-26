library(SimilarityMeasures)


### Name: TrajCheck
### Title: Checking Two Trajectories are Matrices of N Dimensional Points
### Aliases: TrajCheck

### ** Examples

# Creating two trajectories.
path1 <- matrix(c(0, 1, 2, 3, 0, 1, 2, 3), 4)
path2 <- matrix(c(0, 1, 2, 3, 4, 5, 6, 7), 4)
path3 <- matrix(c(0, 1, 2, 3, 4, 5, 6, 7), 2)

# Running the trajectory check on the trajectories.
TrajCheck(path1, path2)
TrajCheck(path1, path3)



