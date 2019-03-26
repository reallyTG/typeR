library(pastecs)


### Name: tsd
### Title: Decomposition of one or several regular time series using
###   various methods
### Aliases: tsd extract.tsd plot.tsd print.specs.tsd print.summary.tsd
###   print.tsd specs.tsd summary.tsd
### Keywords: ts smooth loess nonparametric

### ** Examples

data(releve)
# Regulate the series and extract them as a time series object
rel.regy <- regul(releve$Day, releve[3:8], xmin=6, n=87, units="daystoyears",
        frequency=24, tol=2.2, methods="linear", datemin="21/03/1989",
        dateformat="d/m/Y")
rel.ts <- tseries(rel.regy)

# Decompose all series in the set with the "loess" method
rel.dec <- tsd(rel.ts, method="loess", s.window=13, trend=FALSE)
rel.dec
plot(rel.dec, series=5, col=1:3)    # An plot series 5

# Extract "deseasoned" components
rel.des <- extract(rel.dec, series=3:6, components="deseasoned")
rel.des[1:10,]

# Further decompose these components with a moving average
rel.des.dec <- tsd(rel.des, method="average", order=2, times=10)
plot(rel.des.dec, series=3, col=c(2, 4, 6))
# In this case, a superposed graph is more appropriate:
plot(rel.des.dec, series=3, col=c(2,4), stack=FALSE, resid=FALSE,
        labels=c("without season cycle", "trend"), lpos=c(0, 55000))
# Extract residuals from the latter decomposition
rel.res2 <- extract(rel.des.dec, components="residuals")



