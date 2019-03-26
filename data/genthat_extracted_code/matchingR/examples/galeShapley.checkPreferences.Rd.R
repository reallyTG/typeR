library(matchingR)


### Name: galeShapley.checkPreferences
### Title: Check if preference order is complete
### Aliases: galeShapley.checkPreferences

### ** Examples

# preferences in proper C++ indexing: galeShapley.checkPreferences(pref)
# will return pref
pref = matrix(c(0, 1, 0,
                1, 0, 1), nrow = 2, ncol = 3, byrow = TRUE)
pref
galeShapley.checkPreferences(pref)

# preferences in R indexing: galeShapley.checkPreferences(pref)
# will return pref-1
pref = matrix(c(1, 2, 1,
                2, 1, 2), nrow = 2, ncol = 3, byrow = TRUE)
pref
galeShapley.checkPreferences(pref)

# incomplete preferences: galeShapley.checkPreferences(pref)
# will return NULL
pref = matrix(c(3, 2, 1,
                2, 1, 2), nrow = 2, ncol = 3, byrow = TRUE)
pref
galeShapley.checkPreferences(pref)



