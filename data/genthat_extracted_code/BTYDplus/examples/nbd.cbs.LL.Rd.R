library(BTYDplus)


### Name: nbd.cbs.LL
### Title: Calculate the log-likelihood of the NBD model
### Aliases: nbd.cbs.LL

### ** Examples

data("groceryElog")
cbs <- elog2cbs(groceryElog)
params <- nbd.EstimateParameters(cbs)
nbd.cbs.LL(params, cbs)



