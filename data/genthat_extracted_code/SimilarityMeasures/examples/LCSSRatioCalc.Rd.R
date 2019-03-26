library(SimilarityMeasures)


### Name: LCSSRatioCalc
### Title: Find the LCSS Ratio using Two Trajectories Without Translations
### Aliases: LCSSRatioCalc

### ** Examples

# Creating two trajectories.
path1 <- matrix(c(0, 1, 2, 3, 0, 1, 2, 3), 4)
path2 <- matrix(c(0, 1, 2, 3, 4, 5, 6, 7), 4)

# Running the LCSS ratio algorithm on the trajectories.
LCSSRatioCalc(path1, path2, 2, 2, c(0, 3))



