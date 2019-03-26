library(gamlss.inf)


### Name: sda
### Title: Data for using for simulation
### Aliases: sda
### Keywords: datasets

### ** Examples

data(sda)
fmu <- splinefun(sda$x, sda$mu)
curve(fmu, -2,2)
fsigma <- splinefun(sda$x, sda$sigma)
curve(fsigma, -2,2)
fnu <- splinefun(sda$x, sda$nu)
curve(fnu, -2,2)
ftau <- splinefun(sda$x, sda$tau)
curve(ftau, -2,2)



