library(rcarbon)


### Name: calibrate
### Title: Calibrate radiocarbon dates
### Aliases: calibrate calibrate.default

### ** Examples

x1 <- calibrate(x=4000, errors=30)
plot(x1)
summary(x1)
# Example with a Marine Date, using a DeltaR of 300 and a DeltaR error of 30
x2 <- calibrate(x=4000, errors=30, calCurves='marine13', resOffsets=300, resErrors=30)
plot(x2)



