library(DALY)


### Name: getDALY
### Title: Initiate the DALY calculation process
### Aliases: getDALY
### Keywords: output

### ** Examples

## Not run: 
##D 
##D ##= load the NCC example ==================================
##D setDALYexample(1)
##D 
##D ##= perform DALY calculation  =============================
##D ##= without age weighting and time discounting ============
##D getDALY(aw = FALSE, dr = 0)
##D 
##D ##= perform DALY calculation, store results in 'x' ========
##D ##= (with age weighting and a 3% time discount rate) ======
##D x <- getDALY(aw = TRUE, dr = 0.03)
##D 
##D ##= view the structure of 'x' =============================
##D str(x)
##D 
##D ##= view the DALY calculation results =====================
##D print(x)                   # absolute, total ==============
##D print(x, relative = TRUE)  # relative (ie, per 1000 pop) ==
##D print(x, outcomes = TRUE)  # outcome-wise =================
##D 
##D ##= obtain minimum & maximum simulated DALY ===============
##D min(x[[1]]$DALY)
##D max(x[[1]]$DALY)
##D 
##D ##= standardized DALY histogram ===========================
##D hist(x)
##D 
##D ##= DALY sensitivity analysis =============================
##D sensitivity(x)
## End(Not run)


