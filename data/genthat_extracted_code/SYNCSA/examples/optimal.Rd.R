library(SYNCSA)


### Name: optimal
### Title: Searching for optimal traits
### Aliases: optimal print.optimal print.optimal
### Keywords: SYNCSA

### ** Examples

data(flona)
optimal(flona$community, flona$traits, flona$environment, subset.min = 3,
   subset.max = 5, pattern = "tcap")
optimal(flona$community, flona$traits, flona$environment, subset.min = 3,
   subset.max = 5, pattern = "tdap")
optimal(flona$community, flona$traits, flona$environment, subset.min = 3,
   subset.max = 5, pattern = "tcap.tdap")
put.together <- list(c("fol", "sem"), c("tam", "red"))
put.together
optimal(flona$community, flona$traits, flona$environment, subset.min = 1,
   subset.max = 3, pattern = "tcap", put.together = put.together)



