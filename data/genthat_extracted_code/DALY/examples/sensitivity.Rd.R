library(DALY)


### Name: sensitivity
### Title: DALY sensitivity analysis
### Aliases: sensitivity print.DALY_sensitivity plot.DALY_sensitivity
### Keywords: output sensitivity

### ** Examples

## Not run: 
##D 
##D ##= load NCC example ======================================
##D setDALYexample(1)
##D 
##D ##= perform DALY calculation, store results in 'x' ========
##D x <- getDALY()
##D 
##D ##= perform DALY sensitivity analysis =====================
##D 
##D ## default sensitivity analysis
##D sa <- sensitivity(x)
##D print(sa)
##D 
##D ## tornado plot of default sensitivity analysis
##D plot(sa, show_values = TRUE)
##D 
##D ## standardized regression coefficients -------------------
##D sensitivity(x, method = "src", rank = FALSE, mapped = TRUE)
##D sensitivity(x, method = "src", rank = FALSE, mapped = FALSE)
##D 
##D ## standardized rank regression coefficients --------------
##D sensitivity(x, method = "src", rank = TRUE, mapped = TRUE)
##D sensitivity(x, method = "src", rank = TRUE, mapped = FALSE)
##D 
##D ## partial correlation coefficients -----------------------
##D sensitivity(x, method = "pcc", rank = FALSE)
##D 
##D ## partial rank correlation coefficients ------------------
##D sensitivity(x, method = "pcc", rank = FALSE)
## End(Not run)


