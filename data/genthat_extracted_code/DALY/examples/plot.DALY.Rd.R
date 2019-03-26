library(DALY)


### Name: plot.DALY
### Title: Plot method for class 'DALY'
### Aliases: plot.DALY
### Keywords: output

### ** Examples

## Not run: 
##D 
##D ##= load toxoplasmosis example ============================
##D setDALYexample(2)
##D 
##D ##= perform DALY calculation, store results in 'x'  =======
##D x <- getDALY()
##D 
##D ##= plot results ==========================================
##D par(mar = c(4, 7, 4, 1))
##D plot(x)
##D 
##D plot(x, bars = FALSE)        # only error bars
##D plot(x, error_bars = FALSE)  # only barplots
## End(Not run)


