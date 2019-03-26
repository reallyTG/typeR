library(IndexNumR)


### Name: quantityIndex
### Title: Computes a bilateral quantity index
### Aliases: quantityIndex

### ** Examples

# chained Fisher quantity index for the CES_sigma_2 dataset
quantityIndex(CES_sigma_2, pvar="prices", qvar="quantities", pervar="time",
prodID = "prodID", indexMethod = "fisher", output="chained")



