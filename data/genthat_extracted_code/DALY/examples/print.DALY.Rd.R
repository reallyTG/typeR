library(DALY)


### Name: print.DALY
### Title: Print method for class 'DALY'
### Aliases: print.DALY
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
##D print(x)                   # absolute, total ==============
##D print(x, prob = .90)       # absolute, total (90% CrI) ====
##D print(x, relative = TRUE)  # relative (ie, per 1000 pop) ==
##D print(x, outcomes = TRUE)  # outcome-wise =================
## End(Not run)


