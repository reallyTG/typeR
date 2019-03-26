library(Compositional)


### Name: Fitting a Dirichlet distribution via Newton-Rapshon
### Title: Fitting a Dirichlet distribution via Newton-Rapshon
### Aliases: diri.nr
### Keywords: Dirichlet distribution maximum likelihood estimation
###   Newton-Raphson

### ** Examples

x <- rdiri( 100, c(5, 7, 5, 8, 10, 6, 4) )
diri.nr(x)
diri.nr(x, type = 2)
diri.est(x)



