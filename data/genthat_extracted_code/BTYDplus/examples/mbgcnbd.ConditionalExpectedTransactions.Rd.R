library(BTYDplus)


### Name: mbgcnbd.ConditionalExpectedTransactions
### Title: (M)BG/CNBD-k Conditional Expected Transactions
### Aliases: bgcnbd.ConditionalExpectedTransactions
###   mbgcnbd.ConditionalExpectedTransactions

### ** Examples

## Not run: 
##D data("groceryElog")
##D cbs <- elog2cbs(groceryElog)
##D params <- mbgcnbd.EstimateParameters(cbs, k = 2)
##D # estimate transactions for next 12 weeks
##D xstar.est <- mbgcnbd.ConditionalExpectedTransactions(params,
##D   T.star = 12, cbs$x, cbs$t.x, cbs$T.cal)
##D head(xstar.est) # expected number of transactions for first 6 customers
##D sum(xstar.est) # expected total number of transactions during holdout
## End(Not run)



