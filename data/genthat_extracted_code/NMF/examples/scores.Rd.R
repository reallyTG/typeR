library(NMF)


### Name: featureScore
### Title: Feature Selection in NMF Models
### Aliases: extractFeatures extractFeatures,matrix-method
###   extractFeatures-methods extractFeatures,NMF-method featureScore
###   featureScore,matrix-method featureScore-methods
###   featureScore,NMF-method
### Keywords: methods

### ** Examples

## Don't show: 
# roxygen generated flag
options(R_CHECK_RUNNING_EXAMPLES_=TRUE)
## End(Don't show)

# random NMF model
x <- rnmf(3, 50,20)

# probably no feature is selected
extractFeatures(x)
# extract top 5 for each basis
extractFeatures(x, 5L)
# extract features that have a relative basis contribution above a threshold
extractFeatures(x, 0.5)
# ambiguity?
extractFeatures(x, 1) # means relative contribution above 100%
extractFeatures(x, 1L) # means top contributing feature in each component



