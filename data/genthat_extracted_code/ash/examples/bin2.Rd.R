library(ash)


### Name: bin2
### Title: 2D binning
### Aliases: bin2
### Keywords: nonparametric

### ** Examples

x <- matrix( rnorm(200), 100 , 2)       # bivariate normal n=100
ab <- matrix( c(-5,-5,5,5), 2, 2)       # interval [-5,5) x [-5,5)
nbin <- c( 20, 20)                      # 400 bins
bins <- bin2(x, ab, nbin)               # bin counts,ab,nskip



