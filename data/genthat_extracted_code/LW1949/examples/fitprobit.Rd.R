library(LW1949)


### Name: fitprobit
### Title: Fit a Probit Regression to Dose-Effect Data
### Aliases: fitprobit

### ** Examples

toxdat <- data.frame(
 dose=c(0.05, 0.0625, 0.125, 0.25, 0.5, 1),
  ntot=rep(8, 6),
  nfx = c(0, 1, 4, 4, 6, 8))
fitprobit(toxdat)



