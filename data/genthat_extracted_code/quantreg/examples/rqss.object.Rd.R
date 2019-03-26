library(quantreg)


### Name: rqss.object
### Title: RQSS Objects and Summarization Thereof
### Aliases: rqss.object logLik.rqss AIC.rqss fitted.rqss resid.rqss
###   print.rqss
### Keywords: regression smooth robust

### ** Examples

require(MatrixModels)
n <- 200
x <- sort(rchisq(n,4))
z <- x + rnorm(n)
y <- log(x)+ .1*(log(x))^2 + log(x)*rnorm(n)/4 + z
plot(x, y-z)
f.N  <- rqss(y ~ qss(x, constraint= "N") + z)
f.I  <- rqss(y ~ qss(x, constraint= "I") + z)
f.CI <- rqss(y ~ qss(x, constraint= "CI") + z)

lines(x[-1], f.N $coef[1] + f.N $coef[-(1:2)])
lines(x[-1], f.I $coef[1] + f.I $coef[-(1:2)], col="blue")
lines(x[-1], f.CI$coef[1] + f.CI$coef[-(1:2)], col="red")

## A bivariate example
data(CobarOre)
fCO <- rqss(z ~ qss(cbind(x,y), lambda= .08), data=CobarOre)
plot(fCO)



