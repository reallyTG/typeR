library(extRemes)


### Name: lr.test
### Title: Likelihood-Ratio Test
### Aliases: lr.test
### Keywords: htest

### ** Examples

data(PORTw)
fit0 <- fevd(PORTw$TMX1, type="Gumbel") 
fit1 <- fevd(PORTw$TMX1)
fit2 <- fevd(TMX1, PORTw, scale.fun=~STDTMAX)
lr.test(fit0, fit1)
lr.test(fit1, fit2)




