library(PCRedux)


### Name: hookregNL
### Title: hookregNL - A function to calculate the slope of amplification
###   curves in the tail region
### Aliases: hookregNL

### ** Examples

# Analyze data from the boggy data set for potential hook effect like
# curvature
library(qpcR)
# has hook
res <- hookregNL(boggy[, 1], boggy[, 2])
res

# has no hook
res <- hookregNL(boggy[, 1], boggy[, 12])
res



