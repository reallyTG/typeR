library(POT)


### Name: retlev.bvpot
### Title: Return Level Plot: Bivariate Case
### Aliases: retlev.bvpot
### Keywords: hplot models

### ** Examples

x <- rbvgpd(1000, alpha = 0.25, mar1 = c(0, 1, 0.25))
Mlog <- fitbvgpd(x, c(0, 0), "log")
retlev(Mlog)



