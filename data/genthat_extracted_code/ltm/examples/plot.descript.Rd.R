library(ltm)


### Name: plot descript
### Title: Descriptive Statistics Plot method
### Aliases: plot.descript
### Keywords: methods

### ** Examples


## Descriptives for WIRS data:
dsc <- descript(WIRS)
dsc
plot(dsc, includeFirstLast = TRUE, type = "b", lty = 1, pch = 1:6)
legend("topleft", names(WIRS), pch = 1:6, col = 1:6, lty = 1, bty = "n")




