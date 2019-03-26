library(svars)


### Name: stability
### Title: Structural stability of a VAR(p)
### Aliases: stability stability.varest
### Keywords: "Empirical "Structural "Vector "efp" Fluctuation Process"
###   Stability" VAR autoregressive model" regression

### ** Examples

## No test: 
data(Canada)
var.2c <- VAR(Canada, p = 2, type = "const")
var.2c.stabil <- stability(var.2c, type = "OLS-CUSUM")
var.2c.stabil
plot(var.2c.stabil)

data(USA)
v1 <- VAR(USA, p = 6)
x1 <- stability(v1, type = "mv-chow-test")
plot(x1)

## End(No test)



