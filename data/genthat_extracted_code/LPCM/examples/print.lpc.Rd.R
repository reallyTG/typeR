library(LPCM)


### Name: print.lpc
### Title: Printing output for lpc and lpc.spline objects
### Aliases: print.lpc print.lpc.spline
### Keywords: multivariate

### ** Examples

data(calspeedflow)
lpc1 <- lpc(calspeedflow[,3:4])
print(lpc1)
lpc2 <- lpc.spline(lpc1)
print(lpc2)




