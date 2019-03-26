library(SimilarityMeasures)


### Name: FrechetCheck
### Title: Checks a Frechet Leash Distance
### Aliases: FrechetCheck

### ** Examples

# Creating two trajectories.
path1 <- matrix(c(0, 1, 2, 3, 0, 1, 2, 3), 4)
path2 <- matrix(c(0, 1, 2, 3, 4, 5, 6, 7), 4)

# Running the Frechet distance algorithm with a test leash of 2.
Frechet(path1, path2, 2)



