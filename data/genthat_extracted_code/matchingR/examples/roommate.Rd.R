library(matchingR)


### Name: roommate
### Title: Compute matching for one-sided markets
### Aliases: roommate

### ** Examples

# example using cardinal utilities
utils = matrix(c(-1.63, 0.69, -1.38, -0.03,
                  2.91, -0.52, 0.52, 0.22,
                  0.53, -0.52, -1.18, 0.53), byrow=TRUE, ncol = 4, nrow = 3)
utils
results = roommate(utils = utils)
results

# example using preference orders
pref = matrix(c(3, 1, 2, 3,
                4, 3, 4, 2,
                2, 4, 1, 1), byrow = TRUE, ncol = 4)
pref
results = roommate(pref = pref)
results



