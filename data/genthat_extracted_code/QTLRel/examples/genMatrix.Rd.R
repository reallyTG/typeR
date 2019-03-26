library(QTLRel)


### Name: genMatrix
### Title: Derive genetic matrices
### Aliases: genMatrix

### ** Examples

data(miscEx)

ids<- sample(pedF8$id[300:500],20)

## Not run: 
##D # get condensed identity coefficients
##D oo<- cic(pedF8, ids=ids, df=0)
##D ksp<- kinship(pedF8, ids=ids) # kinship coefficients only
##D # extract genetic matrices
##D gm<- genMatrix(oo)
##D sum((gm$AA-2*ksp)>1e-7) # same results
## End(Not run)



