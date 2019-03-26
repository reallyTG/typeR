library(BTYDplus)


### Name: mbgcnbd.ExpectedCumulativeTransactions
### Title: (M)BG/CNBD-k Expected Cumulative Transactions
### Aliases: bgcnbd.ExpectedCumulativeTransactions
###   mbgcnbd.ExpectedCumulativeTransactions

### ** Examples

## Not run: 
##D data("groceryElog")
##D cbs <- elog2cbs(groceryElog)
##D params <- mbgcnbd.EstimateParameters(cbs, k = 2)
##D # Returns a vector containing expected cumulative repeat transactions for 104
##D # weeks, with every eigth week being reported.
##D mbgcnbd.ExpectedCumulativeTransactions(params,
##D   T.cal = cbs$T.cal,
##D   T.tot = 104,
##D   n.periods.final = 104 / 8)
## End(Not run)



