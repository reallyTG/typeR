library(evd)


### Name: plot.profile.evd
### Title: Plot Profile Log-likelihoods and Calculate Profile Confidence
###   Intervals
### Aliases: plot.profile.evd
### Keywords: hplot

### ** Examples

uvdata <- rgev(100, loc = 0.13, scale = 1.1, shape = 0.2)
M1 <- fgev(uvdata)
## Not run: M1P <- profile(M1)
## Not run: par(mfrow = c(2,2))
## Not run: cint <- plot(M1P, ci = c(0.95, 0.99))
## Not run: cint



