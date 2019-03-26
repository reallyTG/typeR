library(matchingR)


### Name: roommate.checkStability
### Title: Check if a roommate matching is stable
### Aliases: roommate.checkStability

### ** Examples

# define preferences
pref = matrix(c(3, 1, 2, 3,
                4, 3, 4, 2,
                2, 4, 1, 1), byrow = TRUE, ncol = 4)
pref
# compute matching
results = roommate(pref = pref)
results
# check if matching is stable
roommate.checkStability(pref = pref, matching = results)



