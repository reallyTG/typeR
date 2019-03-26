library(BayesFactor)


### Name: generalTestBF
### Title: Function to compute Bayes factors for general designs
### Aliases: generalTestBF
### Keywords: htest

### ** Examples

## Puzzles example: see ?puzzles and ?anovaBF
data(puzzles)
## neverExclude argument makes sure that participant factor ID
## is in all models
result = generalTestBF(RT ~ shape*color + ID, data = puzzles, whichRandom = "ID",
neverExclude="ID", progress=FALSE)
result




