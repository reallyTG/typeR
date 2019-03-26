library(pastecs)


### Name: deccensus
### Title: Time decomposition using the CENSUS II method
### Aliases: deccensus
### Keywords: ts smooth

### ** Examples

data(releve)
# Get regulated time series with a 'years' time-scale
rel.regy <- regul(releve$Day, releve[3:8], xmin=6, n=87, units="daystoyears",
    frequency=24, tol=2.2, methods="linear", datemin="21/03/1989", dateformat="d/m/Y")
rel.ts <- tseries(rel.regy)
# We must have complete cycles to allow using deccensus()
start(rel.ts)
end(rel.ts)
rel.ts2 <- window(rel.ts, end=c(1992,5))
rel.dec2 <- deccensus(rel.ts2[, "Melosul"], trend=TRUE)
plot(rel.dec2, col=c(1,4,3,2))



