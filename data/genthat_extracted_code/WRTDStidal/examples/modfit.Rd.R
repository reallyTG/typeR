library(WRTDStidal)


### Name: modfit
### Title: Fit weighted regression and get predicted/normalized response
###   variable
### Aliases: modfit modfit.default modfit.tidal modfit.tidalmean
###   modfit.data.frame

### ** Examples

## Not run: 
##D ## load data
##D data(chldat)
##D 
##D ## fit the model and get predicted/normalized data for response variable
##D # default median fit
##D # grids predicted across salinity range with ten values
##D res <- modfit(chldat)
##D 
##D # for mean models
##D res <- modfit(chldat, resp_type = 'mean')
##D 
##D ## fit different quantiles and smaller interpolation grid
##D res <- modfit(chldat, tau = c(0.2, 0.8), flo_div = 5)
##D 
##D ## fit with different window widths
##D # half-window widths of one day, five years, and 0.3 salinity
##D res <- modfit(chldat, wins = list(1, 5, 0.3))
##D 
##D ## suppress console output
##D res <- modfit(chldat, trace = FALSE)
## End(Not run)



