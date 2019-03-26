library(matchingR)


### Name: galeShapley.checkStability
### Title: Check if a two-sided matching is stable
### Aliases: galeShapley.checkStability

### ** Examples

# define cardinal utilities
uM = matrix(c(0.52, 0.85,
              0.96, 0.63,
              0.82, 0.08,
              0.55, 0.34), nrow = 4, byrow = TRUE)
uW = matrix(c(0.76, 0.88, 0.74, 0.02,
              0.32, 0.21, 0.02, 0.79), ncol = 4, byrow = TRUE)
# define matching
results = list(
     proposals = matrix(c(2, 1), ncol = 1),
     engagements = matrix(c(2, 1, NA, NA), ncol = 1))
# check stability
galeShapley.checkStability(uM, uW, results$proposals, results$engagements)

# if preferences are in ordinal form, we can use galeShapley.validate
# to transform them into cardinal form and then use checkStability()
prefM = matrix(c(2, 1,
                 3, 2,
                 4, 4,
                 1, 3), nrow = 4, byrow = TRUE)
prefW = matrix(c(1, 1, 1, 2,
                 2, 2, 2, 1), ncol = 4, byrow = TRUE)
# define matching
results = list(proposals = matrix(c(2, 1), ncol = 1),
               engagements = matrix(c(2, 1, NA, NA), ncol = 1))
# check stability
pref.validated = galeShapley.validate(proposerPref = prefM,
                                      reviewerPref = prefW)
galeShapley.checkStability(pref.validated$proposerUtils,
                           pref.validated$reviewerUtils,
                           results$proposals,
                           results$engagements)



