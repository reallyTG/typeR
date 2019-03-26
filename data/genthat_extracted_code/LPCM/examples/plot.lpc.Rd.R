library(LPCM)


### Name: plot.lpc
### Title: Plotting local principal curves
### Aliases: plot.lpc plot.lpc.spline
### Keywords: multivariate

### ** Examples

data(calspeedflow)
lpc1 <- lpc(calspeedflow[,3:4])
plot(lpc1, type=c("spline","project"), lwd=2)



