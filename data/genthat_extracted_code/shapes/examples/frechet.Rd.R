library(shapes)


### Name: frechet
### Title: Mean shape estimators
### Aliases: frechet
### Keywords: multivariate

### ** Examples


#2D example : female and male Gorillas (cf. Dryden and Mardia, 2016)

data(gorf.dat)
frechet(gorf.dat[,,1:4],mean="intrinsic")




