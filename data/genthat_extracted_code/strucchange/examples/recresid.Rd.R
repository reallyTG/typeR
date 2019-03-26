library(strucchange)


### Name: recresid
### Title: Recursive Residuals
### Aliases: recresid recresid.default recresid.formula recresid.lm
### Keywords: regression

### ** Examples

x <- rnorm(100) + rep(c(0, 2), each = 50)
rr <- recresid(x ~ 1)
plot(cumsum(rr), type = "l")

plot(efp(x ~ 1, type = "Rec-CUSUM"))



