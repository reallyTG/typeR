library(pastecs)


### Name: decevf
### Title: Time series decomposition using eigenvector filtering (EVF)
### Aliases: decevf
### Keywords: ts smooth

### ** Examples

data(releve)
melo.regy <- regul(releve$Day, releve$Melosul, xmin=9, n=87,
        units="daystoyears", frequency=24, tol=2.2, methods="linear",
        datemin="21/03/1989", dateformat="d/m/Y")
melo.ts <- tseries(melo.regy)
acf(melo.ts)
# Autocorrelation is not significant after 0.16
# That corresponds to a lag of 0.16*24=4 (frequency=24)
melo.evf <- decevf(melo.ts, lag=4, axes=1)
plot(melo.evf, col=c(1, 4, 2))
# A superposed graph is better in the present case
plot(melo.evf, col=c(1, 4), xlab="stations", stack=FALSE, resid=FALSE,
        lpos=c(0, 60000))



