library(SimilarityMeasures)


### Name: Frechet
### Title: Run the Frechet Calculation Algorithm on Two Trajectories
### Aliases: Frechet

### ** Examples

# Creating two trajectories.
path1 <- matrix(c(0, 1, 2, 3, 0, 1, 2, 3), 4)
path2 <- matrix(c(0, 1, 2, 3, 4, 5, 6, 7), 4)

# Running the Frechet distance algorithm.
Frechet(path1, path2)



