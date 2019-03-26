library(QTLRel)


### Name: cic
### Title: Calculate Jacquard condensed identity coefficients
### Aliases: cic

### ** Examples

data(miscEx)

ids<- sample(pedF8$id[300:500],20)

## Not run: 
##D # run 'cic' for the sampled individuals
##D # top-down
##D oo<- cic(pedF8, ids=ids, df=Inf, msg=TRUE)
##D # bottom-up
##D o0<- cic(pedF8, ids=ids, df=0, msg=TRUE)
##D # hybrid of top-down and bottom-up
##D o2<- cic(pedF8, ids=ids, ask=TRUE, msg=TRUE)
##D # same results
##D c(sum(abs(oo-o0) >1e-7),sum(abs(o2-o0) >1e-7))
## End(Not run)



