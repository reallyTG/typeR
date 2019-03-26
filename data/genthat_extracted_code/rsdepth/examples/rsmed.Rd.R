library(rsdepth)


### Name: rsmed
### Title: Bivariate RS median
### Aliases: rsmed rsmed.default
### Keywords: bivariate multivariate nonparametric robust

### ** Examples

##  RS median of a two-dimensional data set
set.seed(617)
zz <- matrix(rnorm(120), nc = 2)
rsmed(zz,eps=0.2)




