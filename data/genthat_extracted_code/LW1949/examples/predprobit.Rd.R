library(LW1949)


### Name: predprobit
### Title: Determine the Effective Dose from a Probit Regression Fit
### Aliases: predprobit

### ** Examples

toxdat <- data.frame(
 dose=c(0.05, 0.0625, 0.125, 0.25, 0.5, 1),
 ntot=rep(8, 6),
 nfx = c(0, 1, 4, 4, 6, 8))
myfit <- fitprobit(toxdat)
predprobit(50, myfit)



