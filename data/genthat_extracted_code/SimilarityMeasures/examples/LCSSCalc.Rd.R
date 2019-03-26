library(SimilarityMeasures)


### Name: LCSSCalc
### Title: Run the LCSS Algorithm on Two Trajectories Without Translations
### Aliases: LCSSCalc

### ** Examples

# Creating two trajectories.
path1 <- matrix(c(0, 1, 2, 3, 0, 1, 2, 3), 4)
path2 <- matrix(c(0, 1, 2, 3, 4, 5, 6, 7), 4)

# Running the LCSS algorithm on the trajectories.
LCSSCalc(path1, path2, 2, 2, c(0, 3))



