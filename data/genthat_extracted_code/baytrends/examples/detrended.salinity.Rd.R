library(baytrends)


### Name: detrended.salinity
### Title: Create Seasonally Detrended Salinty Data Set
### Aliases: detrended.salinity

### ** Examples

## Not run: 
##D # Show Example Dataset (sal)
##D str(sal)
##D 
##D # Define Function Inputs
##D df.sal        <- sal
##D dvAvgWinSel   <- 30
##D lowess.f      <- 0.2
##D minObs        <- 40
##D minObs.sd    <- 10
##D                  
##D # Run Function
##D salinity.detrended <- detrended.salinity(df.sal, dvAvgWinSel, 
##D                                  lowess.f, minObs, minObs.sd) 
## End(Not run)              



