library(extRemes)


### Name: trans
### Title: Transform Data
### Aliases: trans trans.fevd
### Keywords: distribution methods manip

### ** Examples

data(PORTw)

fit <- fevd(TMX1, PORTw, location.fun=~AOindex, units="deg C")
fit

z <- trans(fit)

fevd(z)




