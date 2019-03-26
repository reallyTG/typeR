library(SimilarityMeasures)


### Name: LCSS
### Title: Run the LCSS Algorithm on Two Trajectories Allowing Translations
### Aliases: LCSS

### ** Examples

# Creating two trajectories.
path1 <- matrix(c(0, 1, 2, 3, 0, 1, 2, 3), 4)
path2 <- matrix(c(0, 1, 2, 3, 4, 5, 6, 7), 4)

# Running the LCSS algorithm on the trajectories.
LCSS(path1, path2, 2, 2, 0.5)

# Running the LCSS algorithm on the trajectories
# and returning the translation as well.
LCSS(path1, path2, 2, 2, 0.5, TRUE)



