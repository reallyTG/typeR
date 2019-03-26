library(SimilarityMeasures)


### Name: LCSSTranslation
### Title: Create a Translation Vector Using LCSS
### Aliases: LCSSTranslation

### ** Examples

# Creating two trajectories.
path1 <- matrix(c(0, 1, 2, 3, 0, 1, 2, 3), 4)
path2 <- matrix(c(0, 1, 2, 3, 4, 5, 6, 7), 4)

# Running the translation.
LCSSTranslation(path1, path2, 1, 1, 0.5)



