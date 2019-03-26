library(Compositional)


### Name: Fitting a Dirichlet distribution
### Title: Fitting a Dirichlet distribution
### Aliases: diri.est
### Keywords: Dirichlet distribution maximum likelihood estimation

### ** Examples

x <- rdiri( 100, c(5, 7, 1, 3, 10, 2, 4) )
diri.est(x)
diri.est(x, type = "prec")



