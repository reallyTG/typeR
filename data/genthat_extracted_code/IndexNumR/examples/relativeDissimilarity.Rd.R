library(IndexNumR)


### Name: relativeDissimilarity
### Title: Computes measures of relative dissimilarity between all periods
### Aliases: relativeDissimilarity

### ** Examples

# estimate the dissimilarity between periods in the CES_sigma_2 dataset
# using the log quadratic measure of dissimilarity
relativeDissimilarity(CES_sigma_2, pvar = "prices", qvar="quantities",
pervar = "time", prodID = "prodID", indexMethod="fisher",
similarityMethod = "logquadratic")



