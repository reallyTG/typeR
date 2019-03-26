library(oce)


### Name: airRho
### Title: Air density
### Aliases: airRho

### ** Examples

degC <- seq(0,30,length.out=100)
p <- seq(98,102,length.out=100) * 1e3
contour(x=degC, y=p, z=outer(degC,p,airRho), labcex=1)



