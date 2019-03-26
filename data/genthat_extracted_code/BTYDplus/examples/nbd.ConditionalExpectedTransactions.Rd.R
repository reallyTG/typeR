library(BTYDplus)


### Name: nbd.ConditionalExpectedTransactions
### Title: NBD Conditional Expected Transactions
### Aliases: nbd.ConditionalExpectedTransactions

### ** Examples

data("groceryElog")
cbs <- elog2cbs(groceryElog, T.cal = "2006-12-31")
params <- nbd.EstimateParameters(cbs)
xstar.est <- nbd.ConditionalExpectedTransactions(params, cbs$T.star, cbs$x, cbs$T.cal)
sum(xstar.est) # expected total number of transactions during holdout



