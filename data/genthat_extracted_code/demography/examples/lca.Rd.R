library(demography)


### Name: lca
### Title: Model mortality or fertility data using Lee-Carter approach
### Aliases: lca bms
### Keywords: models

### ** Examples

## Not run: 
##D france.LC1 <- lca(fr.mort, adjust="e0")
##D plot(france.LC1)
##D par(mfrow=c(1,2))
##D plot(fr.mort,years=1953:2002,ylim=c(-11,1))
##D plot(forecast(france.LC1,jumpchoice="actual"),ylim=c(-11,1))
##D 
##D france.bms <- bms(fr.mort, breakmethod="bai")
##D fcast.bms <- forecast(france.bms)
##D par(mfrow=c(1,1))
##D plot(fcast.bms$kt)
## End(Not run)


