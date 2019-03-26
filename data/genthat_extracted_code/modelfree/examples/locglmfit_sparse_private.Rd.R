library(modelfree)


### Name: locglmfit_sparse_private
### Title: Local generalized linear fitting with sparse matrices
### Aliases: locglmfit_sparse_private
### Keywords: nonparametric models regression nonlinear

### ** Examples

data( "01_Miranda" )
xnew = 1.2 * (0:99)/99+0.1
h <- 0.2959
fit <- locglmfit_sparse_private( xnew,  example01$r,  example01$m, example01$x, h, FALSE, "logit_link", 0, 0, 2, 1, "dnorm", 50, 1e-6)



