library(IndexNumR)


### Name: mixScaleDissimilarity
### Title: Computes mix, scale and absolute dissimilarity measures
### Aliases: mixScaleDissimilarity

### ** Examples

# estimate the dissimilarity between periods in the CES_sigma_2 dataset
# using the absolute measure of dissimilarity and the geometric mean
# to combine price and quantity information.
mixScaleDissimilarity(CES_sigma_2, pvar = "prices", qvar = "quantities",
pervar = "time", prodID = "prodID", measure = "absolute",
combine = "geomean")



