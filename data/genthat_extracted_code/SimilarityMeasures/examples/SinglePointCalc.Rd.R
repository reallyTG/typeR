library(SimilarityMeasures)


### Name: SinglePointCalc
### Title: Calculate Frechet Distance With a Single Point Trajectory
### Aliases: SinglePointCalc

### ** Examples

# Creating two trajectories.
path1 <- matrix(c(0, 1), 1)
path2 <- matrix(c(0, 1, 2, 3, 4, 5, 6, 7), 4)

# Running the Frechet distance algorithm which will
# automatically call this function.
Frechet(path1, path2)



