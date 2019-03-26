library(matchingR)


### Name: toptrading
### Title: Compute the top trading cycle algorithm
### Aliases: toptrading

### ** Examples

# example using cardinal utilities
utils = matrix(c(-1.4, -0.66, -0.45, 0.03,
                 0.72, 1.71, 0.59, 0.07,
                 0.44, 1.76, 1.71, -0.27,
                 0.26, 2.18, 1.4, 0.12), byrow = TRUE, nrow = 4)
utils
results = toptrading(utils = utils)
results

# example using ordinal preferences
pref = matrix(c(2, 4, 3, 4,
                3, 3, 4, 2,
                4, 2, 2, 1,
                1, 1, 1, 3), byrow = TRUE, nrow = 4)
pref
results = toptrading(pref = pref)
results



