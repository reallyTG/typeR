library(pastecs)


### Name: tseries
### Title: Convert a 'regul' or a 'tsd' object into a time series
### Aliases: tseries
### Keywords: ts manip

### ** Examples

data(releve)
rel.regy <- regul(releve$Day, releve[3:8], xmin=6, n=87, units="daystoyears",
        frequency=24, tol=2.2, methods="linear", datemin="21/03/1989",
        dateformat="d/m/Y")
# This object is not a time series
is.tseries(rel.regy)     # FALSE
# Extract all time series contained in the 'regul' object
rel.ts <- tseries(rel.regy)
# Now this is a time series
is.tseries(rel.ts)       # TRUE



