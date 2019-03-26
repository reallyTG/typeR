library(strataG)


### Name: popStructTest
### Title: Population Differentiation Tests
### Aliases: popStructTest overallTest pairwiseTest statList

### ** Examples

data(msats.g)
msats.g <- stratify(msats.g, "fine")

# Just an overall Chi-squared test
ovl <- overallTest(msats.g, stats = "chi2", nrep = 100)
ovl

#' Just a pairwise test for Gst
pws <- pairwiseTest(msats.g, stats = list(statGst), nrep = 100)
pws

## Not run: 
##D #' Both overall and pairwise tests for Fst and F'st
##D full <- popStructTest(msats.g, stats = c("fst", "fst.prime"))
##D print(full$overall)
##D print(full$pairwise)
## End(Not run)




