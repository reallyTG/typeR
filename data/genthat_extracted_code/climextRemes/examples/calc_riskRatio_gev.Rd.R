library(climextRemes)


### Name: calc_riskRatio_gev
### Title: Compute risk ratio and uncertainty based on generalized extreme
###   value model fit to block maxima or minima
### Aliases: calc_riskRatio_gev

### ** Examples

data(Fort, package = 'extRemes')
FortMax <- aggregate(Prec ~ year, data = Fort, max)
earlyYears <- 1900:1929
lateYears <- 1970:1999
earlyPeriod <- which(FortMax$year %in% earlyYears)
latePeriod <- which(FortMax$year %in% lateYears)
# contrast late period with early period, assuming a nonstationary fit
# within each time period and finding RR based on midpoint of each period
## Not run: 
##D out <- calc_riskRatio_gev(returnValue = 3,
##D                    y1 = FortMax$Prec[earlyPeriod], y2 = FortMax$Prec[latePeriod],
##D                    x1 = data.frame(years = earlyYears), x2 = data.frame(years = lateYears),
##D                    locationFun1 = ~years, locationFun2 = ~years,
##D                    xNew1 = data.frame(years = mean(earlyYears)),
##D                    xNew2 = data.frame(years = mean(lateYears)))
## End(Not run)



