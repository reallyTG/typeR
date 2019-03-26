library(IndexNumR)


### Name: priceIndex
### Title: Computes a bilateral price index
### Aliases: priceIndex

### ** Examples

# period-on-period Laspeyres index for the CES_sigma_2 dataset
priceIndex(CES_sigma_2, pvar="prices", qvar="quantities", pervar="time",
prodID = "prodID", indexMethod = "laspeyres")

# chained Fisher index
priceIndex(CES_sigma_2, pvar="prices", qvar="quantities", pervar="time",
prodID = "prodID", indexMethod = "fisher", output="chained")

# chained Tornqvist index, with linking periods chosen by the
# weighted log-quadratic dissimilarity measure
priceIndex(CES_sigma_2, pvar="prices", qvar="quantities", pervar="time",
prodID = "prodID", indexMethod = "tornqvist", output="chained",
chainMethod = "logquadratic")



