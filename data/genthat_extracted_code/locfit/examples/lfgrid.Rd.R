library(locfit)


### Name: lfgrid
### Title: Locfit - grid evaluation structure.
### Aliases: lfgrid
### Keywords: smooth

### ** Examples

data(ethanol, package="locfit")
plot.eval(locfit(NOx ~ lp(E, C, scale=TRUE), data=ethanol, ev=lfgrid()))



