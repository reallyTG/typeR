library(LW1949)


### Name: fxcat
### Title: Define Effect Category
### Aliases: fxcat

### ** Examples

toxdat <- data.frame(
  dose=c(0.0625, 0.125, 0.25, 0.5),
  ntot=rep(8, 4),
  nfx = c(0, 4, 6, 8))
cbind(toxdat, fxcat(toxdat))



