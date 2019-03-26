library(LW1949)


### Name: coefprobit
### Title: Calculate the Coefficients of a Probit Regression Fit
### Aliases: coefprobit

### ** Examples

toxdat <- data.frame(
 dose=c(0.05, 0.0625, 0.125, 0.25, 0.5, 1),
 ntot=rep(8, 6),
  nfx = c(0, 1, 4, 4, 6, 8))
myfit <- fitprobit(toxdat)
coefprobit(myfit)



