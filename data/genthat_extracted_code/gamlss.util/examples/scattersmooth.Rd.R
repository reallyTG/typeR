library(gamlss.util)


### Name: scattersmooth
### Title: Two dimensional Smooth scatter plots
### Aliases: scattersmooth
### Keywords: regression

### ** Examples

m <- 1000
set.seed(pi)
phi <- 2 * pi * runif(m)
rho <- rchisq(m, df = 6)
x <- cos(phi) * rho
y <- sin(phi) * rho
H <- scattersmooth(x, y)
H1 <- scattersmooth(x, y, cols=rainbow(100:200)) 
#  If you have the package colorspace use instead 
# library(colorspace)
# H <- scattersmooth(x, y, cols=heat_hcl(100))
# H1 <- scattersmooth(x, y, cols=rainbow_hcl(100))
data(db)
scattersmooth(age, head,  data=db, cols=terrain.colors(101), ndot=2000, lambda=1)
# or if you have colorspace
#scattersmooth(age, head,  data=db, cols=terrain_hcl(100), ndot=2000, lambda=1)



