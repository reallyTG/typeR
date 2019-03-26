library(climextRemes)


### Name: fit_gev
### Title: Fit a generalized extreme value model to block maxima or minima
### Aliases: fit_gev

### ** Examples

data(Fort, package = 'extRemes')
FortMax <- aggregate(Prec ~ year, data = Fort, max)

# stationary fit
out <- fit_gev(FortMax$Prec, returnPeriod = 20, returnValue = 3.5,
        getParams = TRUE, bootSE = FALSE)

# nonstationary fit with location linear in year
out <- fit_gev(FortMax$Prec, x = data.frame(years = FortMax$year), 
        locationFun = ~years, returnPeriod = 20, returnValue = 3.5,
        getParams = TRUE, xNew = data.frame(years = range(FortMax$year)), bootSE = FALSE)



