library(pracma)


### Name: nile
### Title: Nile overflow data
### Aliases: nile
### Keywords: datasets

### ** Examples

data(nile)                      # loads "nile" data frame
## Not run: 
##D nile_dt <- nile[, 2:13]         # erase the "years" column
##D 
##D # plot all years in one figure
##D plot(ts(nile_dt), plot.type="single")
##D 
##D # merge all years in one time series
##D nile_ts <- ts( c(t(nile[, 2:13])), frequency = 12, start = c(1871, 1) )
##D 
##D # aggregated flow per year
##D nile_flow <- apply(nile_dt, 1, sum)
##D 
##D plot(ts(nile_flow, frequency = 1, start = 1871) / 1000,
##D      col = "darkblue", lwd = 2.0,
##D      main = "Nile flows 1871 - 1984", ylab = "Flow / 1000")
##D grid()
##D 
##D # Hurst exponent of yearly Nile flow
##D hurstexp(nile_flow)
##D # Simple R/S Hurst estimation:         0.7348662 
##D # Corrected R over S Hurst exponent:   1.041862 
##D # Empirical Hurst exponent:            0.6975531 
##D # Corrected empirical Hurst exponent:  0.7136607 
##D # Theoretical Hurst exponent:          0.5244148 
## End(Not run)



