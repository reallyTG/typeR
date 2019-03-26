library(gstat)


### Name: variogramLine
### Title: Semivariance Values For a Given Variogram Model
### Aliases: variogramLine getGammas
### Keywords: models

### ** Examples

variogramLine(vgm(5, "Exp", 10, 5), 10, 10)
# anisotropic variogram, plotted in E-W direction:
variogramLine(vgm(1, "Sph", 10, anis=c(0,0.5)), 10, 10)
# anisotropic variogram, plotted in N-S direction:
variogramLine(vgm(1, "Sph", 10, anis=c(0,0.5)), 10, 10, dir=c(0,1,0))
variogramLine(vgm(1, "Sph", 10, anis=c(0,0.5)), dir=c(0,1,0), dist_vector = 0.5)
variogramLine(vgm(1, "Sph", 10, anis=c(0,0.5)), dir=c(0,1,0), dist_vector = c(0, 0.5, 0.75))



