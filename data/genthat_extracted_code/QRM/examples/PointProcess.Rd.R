library(QRM)


### Name: PointProcess
### Title: Point Processes
### Aliases: PointProcess extremalPP unmark fit.POT fit.sePP fit.seMPP
###   stationary.sePP plot.MPP plot.PP plot.sePP sePP.negloglik
###   seMPP.negloglik volfunction SEprocExciteFunc
### Keywords: models

### ** Examples

## Extremal PP
data(sp500)
l <- -returns(sp500) 
lw <- window(l, start = "1995-12-31", end = end(l)) 
mod1 <- extremalPP(lw, ne = 100) 
mod1$marks[1:5]
mod1$threshold
mod2a <- fit.sePP(mod1, mark.influence = FALSE, std.errs = TRUE)
mod2b <- fit.seMPP(mod1, mark.influence = FALSE, std.errs = TRUE)
stationary.sePP(mod2b)
mod2c <- fit.POT(mod1, method = "BFGS")
plot(mod1)
plot(unmark(mod1))
plot(mod2a)



