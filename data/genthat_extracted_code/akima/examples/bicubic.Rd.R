library(akima)


### Name: bicubic
### Title: Bivariate Interpolation for Data on a Rectangular grid
### Aliases: bicubic
### Keywords: dplot

### ** Examples

data(akima760)
# interpolate at the diagonal of the grid [0,8]x[0,10]
akima.bic <- bicubic(akima760$x,akima760$y,akima760$z,
                     seq(0,8,length=50), seq(0,10,length=50))
plot(sqrt(akima.bic$x^2+akima.bic$y^2), akima.bic$z, type="l")




