library(mstR)


### Name: integrate.mstR
### Title: Numerical integration by linear interpolation (for mstR internal
###   use)
### Aliases: integrate.mstR

### ** Examples


  x <- seq(from = -4, to = 4, length = 33)
 y <- exp(x)
 integrate.mstR(x, y) # 54.86381

## Not run: 
##D 
##D  # Comparison with integrate.xy
##D  require(sfsmisc)
##D  integrate.xy(x, y, use.spline = FALSE) # 54.86381
##D  integrate.xy(x, y) # 54.58058
##D  
## End(Not run)



