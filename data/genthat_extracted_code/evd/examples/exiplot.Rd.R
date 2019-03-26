library(evd)


### Name: exiplot
### Title: Plot Estimates of the Extremal Index
### Aliases: exiplot
### Keywords: hplot

### ** Examples

sdat <- mar(100, psi = 0.5)
tlim <- quantile(sdat, probs = c(0.4,0.9))
exiplot(sdat, tlim)
exiplot(sdat, tlim, r = 4, add = TRUE, lty = 2)
exiplot(sdat, tlim, r = 0, add = TRUE, lty = 4)



