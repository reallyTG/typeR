library(schumaker)


### Name: Schumaker
### Title: Create a Schumaker spline
### Aliases: Schumaker

### ** Examples

x = seq(1,6)
y = log(x)
SSS = schumaker::Schumaker(x,y, Vectorised = TRUE)
xarray = seq(1,6,0.01)
Result = SSS$Spline(xarray)
Result2 = SSS$DerivativeSpline(xarray)
Result3 = SSS$SecondDerivativeSpline(xarray)
plot(xarray, Result, ylim=c(-0.5,2))
lines(xarray, Result2, col = 2)
lines(xarray, Result3, col = 3)



