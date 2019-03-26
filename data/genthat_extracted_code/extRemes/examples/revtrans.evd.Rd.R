library(extRemes)


### Name: revtrans.evd
### Title: Reverse Transformation
### Aliases: revtrans.evd
### Keywords: distribution manip

### ** Examples

data(PORTw)

fit <- fevd(TMX1, PORTw, location.fun=~AOindex, units="deg C")
fit

z <- trans(fit)

fevd(z)

p <- findpars(fit)

y <- revtrans.evd(z=z, location=p$location, scale=2.6809613,
    shape=-0.1812824)

fevd(y)

qqplot(y, PORTw$TMX1)





