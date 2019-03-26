library(LPCM)


### Name: Rc
### Title: Measuring goodness-of-fit for principal objects.
### Aliases: Rc Rc.lpc Rc.lpc.spline Rc.ms base.Rc
### Keywords: multivariate

### ** Examples

data(calspeedflow)
lpc1 <- lpc.spline(lpc(calspeedflow[,3:4]), project=TRUE)
Rc(lpc1)
# is the same as:
base.Rc(lpc1$lpcobject$data, lpc1$closest.coords)

ms1 <- ms(calspeedflow[,3:4],plotms=0)
Rc(ms1)
# is the same as:
base.Rc(ms1$data, ms1$cluster.center[ms1$closest.label,], type="points")



