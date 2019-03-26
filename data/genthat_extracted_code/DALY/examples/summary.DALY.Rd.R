library(DALY)


### Name: summary.DALY
### Title: Summary method for class 'DALY'
### Aliases: summary.DALY
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
##D ##= view the DALY calculation results =====================
##D summary(x)                   # absolute, total ============
##D summary(x, relative = TRUE)  # relative (ie, per 1000) ====
##D summary(x, outcomes = TRUE)  # outcome-wise ===============
## End(Not run)


