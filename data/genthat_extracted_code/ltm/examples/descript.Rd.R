library(ltm)


### Name: descript
### Title: Descriptive Statistics
### Aliases: descript
### Keywords: multivariate

### ** Examples


## Descriptives for LSAT data:
dsc <- descript(LSAT, 3)
dsc
plot(dsc, type = "b", lty = 1, pch = 1:5)
legend("topleft", names(LSAT), pch = 1:5, col = 1:5, lty = 1, bty = "n")




