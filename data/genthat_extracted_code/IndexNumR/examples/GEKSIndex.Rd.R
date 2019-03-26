library(IndexNumR)


### Name: GEKSIndex
### Title: Compute a GEKS multilateral index
### Aliases: GEKSIndex

### ** Examples

# compute a GEKS mutlilateral index with mean splicing
GEKSIndex(CES_sigma_2, pvar = "prices", qvar = "quantities", pervar = "time",
prodID = "prodID", indexMethod = "tornqvist", window=11, splice = "mean")

# compute a GEKS multilateral index with window splicing and the Fisher index method
GEKSIndex(CES_sigma_2, pvar = "prices", qvar = "quantities", pervar = "time",
prodID = "prodID", indexMethod = "fisher", window=11, splice = "mean")




