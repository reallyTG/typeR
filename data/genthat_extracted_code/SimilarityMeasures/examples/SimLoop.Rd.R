library(SimilarityMeasures)


### Name: SimLoop
### Title: Loop Over and Test Trajectories With Different Translations
### Aliases: SimLoop

### ** Examples

# Creating two trajectories.
path1 <- matrix(c(0, 1, 2, 3, 0, 1, 2, 3), 4)
path2 <- matrix(c(0, 1, 2, 3, 4, 5, 6, 7), 4)

# Running the LCSS algorithm on the trajectories.
LCSS(path1, path2, 2, 2, 0.5)



