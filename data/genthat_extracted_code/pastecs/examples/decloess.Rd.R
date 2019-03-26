library(pastecs)


### Name: decloess
### Title: Time series decomposition by the LOESS method
### Aliases: decloess
### Keywords: ts smooth

### ** Examples

data(releve)
melo.regy <- regul(releve$Day, releve$Melosul, xmin=9, n=87,
        units="daystoyears", frequency=24, tol=2.2, methods="linear",
        datemin="21/03/1989", dateformat="d/m/Y")
melo.ts <- tseries(melo.regy)
melo.dec <- decloess(melo.ts, s.window="periodic")
plot(melo.dec, col=1:3)



