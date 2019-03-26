library(matchingR)


### Name: galeShapley.marriageMarket
### Title: Gale-Shapley Algorithm: Stable Marriage Problem
### Aliases: galeShapley.marriageMarket galeShapley

### ** Examples

nmen = 5
nwomen = 4
# generate cardinal utilities
uM = matrix(runif(nmen*nwomen), nrow = nwomen, ncol = nmen)
uW = matrix(runif(nwomen*nmen), nrow = nmen, ncol = nwomen)
# run the algorithm using cardinal utilities as inputs
results = galeShapley.marriageMarket(uM, uW)
results

# transform the cardinal utilities into preference orders
prefM = sortIndex(uM)
prefW = sortIndex(uW)
# run the algorithm using preference orders as inputs
results = galeShapley.marriageMarket(proposerPref = prefM, reviewerPref = prefW)
results



