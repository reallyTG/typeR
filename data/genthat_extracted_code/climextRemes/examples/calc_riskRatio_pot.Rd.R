library(climextRemes)


### Name: calc_riskRatio_pot
### Title: Compute risk ratio and uncertainty based on peaks-over-threshold
###   models fit to exceedances over a threshold
### Aliases: calc_riskRatio_pot

### ** Examples

data(Fort, package = 'extRemes')
threshold <- 0.395
ord <- order(Fort$year, Fort$month, Fort$day) 
Fort <- Fort[ord, ]
ind <- Fort$Prec > threshold
FortExc <- Fort[ind, ]
earlyYears <- 1900:1929
lateYears <- 1970:1999
earlyPeriod <- which(FortExc$year %in% earlyYears)
latePeriod <- which(FortExc$year %in% lateYears)
# contrast late period with early period, assuming a nonstationary fit
# within each time period and finding RR based on midpoint of each period
# lrtCI set to FALSE here to limit time in running examples on CRAN
## Not run: 
##D out <- calc_riskRatio_pot(returnValue = 3,
##D                    y1 = FortExc$Prec[earlyPeriod], y2 = FortExc$Prec[latePeriod],
##D                    x1 = data.frame(years = earlyYears), x2 = data.frame(years = lateYears),
##D                    threshold1 = threshold, threshold2 = threshold,
##D                    locationFun1 = ~years, locationFun2 = ~years,
##D                    xNew1 = data.frame(years = mean(earlyYears)), 
##D 	      xNew2 = data.frame(years = mean(lateYears)),
##D                    blockIndex1 = FortExc$year[earlyPeriod], 
##D                    blockIndex2 = FortExc$year[latePeriod],
##D                    firstBlock1 = earlyYears[1], firstBlock2 = lateYears[1],
##D                    ciType = c('lrt'))
## End(Not run)



