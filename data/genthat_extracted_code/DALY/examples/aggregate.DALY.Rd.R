library(DALY)


### Name: aggregate.DALY
### Title: Aggregate method for class 'DALY'
### Aliases: aggregate.DALY
### Keywords: output

### ** Examples

## Not run: 
##D 
##D ##= load the NCC example ==================================
##D setDALYexample(1)
##D 
##D ##= perform DALY calculation, store results in 'x' ========
##D x <- getDALY()
##D 
##D ##= store simulations aggregated by =======================
##D ##= outcome and age/sex class     =========================
##D y <- aggregate(x, by = "total")
##D 
##D summary(y$DALY)  # default summary of total DALYs =========
##D hist(y$deaths)   # default histogram of total deaths ======
## End(Not run)


