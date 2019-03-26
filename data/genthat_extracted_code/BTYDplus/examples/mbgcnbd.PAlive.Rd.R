library(BTYDplus)


### Name: mbgcnbd.PAlive
### Title: (M)BG/CNBD-k P(alive)
### Aliases: bgcnbd.PAlive mbgcnbd.PAlive

### ** Examples

## Not run: 
##D data("groceryElog")
##D cbs <- elog2cbs(groceryElog)
##D params <- mbgcnbd.EstimateParameters(cbs)
##D palive <- mbgcnbd.PAlive(params, cbs$x, cbs$t.x, cbs$T.cal)
##D head(palive) # Probability of being alive for first 6 customers
##D mean(palive) # Estimated share of customers to be still alive
## End(Not run)



