library(matchingR)


### Name: galeShapley.validate
### Title: Input validation of preferences
### Aliases: galeShapley.validate

### ** Examples

# market size
nmen = 5
nwomen = 4

# generate cardinal utilities
uM = matrix(runif(nmen*nwomen), nrow = nwomen, ncol = nmen)
uW = matrix(runif(nwomen*nmen), nrow = nmen, ncol = nwomen)

# turn cardinal utilities into ordinal preferences
prefM = sortIndex(uM)
prefW = sortIndex(uW)

# validate cardinal preferences
preferences = galeShapley.validate(uM, uW)
preferences

# validate ordinal preferences
preferences = galeShapley.validate(proposerPref = prefM, reviewerPref = prefW)
preferences

# validate ordinal preferences when these are in R style indexing
# (instead of C++ style indexing)
preferences = galeShapley.validate(proposerPref = prefM + 1, reviewerPref = prefW + 1)
preferences

# validate preferences when proposer-side is cardinal and reviewer-side is ordinal
preferences = galeShapley.validate(proposerUtils = uM, reviewerPref = prefW)
preferences



