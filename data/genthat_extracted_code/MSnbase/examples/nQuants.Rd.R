library(MSnbase)


### Name: nQuants
### Title: Count the number of quantitfied features.
### Aliases: nQuants

### ** Examples

data(msnset)
n <- 2
msnset <- topN(msnset, groupBy = fData(msnset)$ProteinAccession, n)
m <- nQuants(msnset, groupBy = fData(msnset)$ProteinAccession)
msnset2 <- combineFeatures(msnset,
                           groupBy = fData(msnset)$ProteinAccession,
                           fun = sum)
stopifnot(dim(n) == dim(msnset2))
head(exprs(msnset2))
head(exprs(msnset2) * (n/m))



