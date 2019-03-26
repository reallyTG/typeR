library(akima)


### Name: bilinear
### Title: Bilinear Interpolation for Data on a Rectangular grid
### Aliases: bilinear
### Keywords: dplot

### ** Examples

data(akima760)
# interpolate at the diagonal of the grid [0,8]x[0,10]
akima.bil <- bilinear(akima760$x,akima760$y,akima760$z,
                     seq(0,8,length=50), seq(0,10,length=50))
plot(sqrt(akima.bil$x^2+akima.bil$y^2), akima.bil$z, type="l")



