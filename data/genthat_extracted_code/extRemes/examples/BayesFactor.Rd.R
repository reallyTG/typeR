library(extRemes)


### Name: BayesFactor
### Title: Estimate Bayes Factor
### Aliases: BayesFactor
### Keywords: htest

### ** Examples

data(PORTw)
fB <- fevd(TMX1, PORTw, method = "Bayesian", iter = 500)
fB2 <- fevd(TMX1, PORTw, location.fun = ~AOindex,
    method = "Bayesian", iter = 500)

BayesFactor(fB, fB2, burn.in = 100, method = "harmonic")




