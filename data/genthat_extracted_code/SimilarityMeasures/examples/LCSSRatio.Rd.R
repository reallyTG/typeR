library(SimilarityMeasures)


### Name: LCSSRatio
### Title: Find the LCSS Ratio using Two Trajectories Allowing Translations
### Aliases: LCSSRatio

### ** Examples

# Creating two trajectories.
path1 <- matrix(c(0, 1, 2, 3, 0, 1, 2, 3), 4)
path2 <- matrix(c(0, 1, 2, 3, 4, 5, 6, 7), 4)

# Running the LCSS ratio algorithm on the trajectories.
LCSSRatio(path1, path2, 2, 2, 0.5)

# Running the LCSS ratio algorithm on the trajectories
# and returning the translation as well.
LCSSRatio(path1, path2, 2, 2, 0.5, TRUE)



