library(deformula)


### Name: deformula.moneone
### Title: Integration of one-dimensitonal functions over finite iterval
###   with the double exponential formula.
### Aliases: deformula.moneone

### ** Examples


f <- function(x, a) exp(-a*x)

deformula.moneone(f, 1, 0, a=0.1)




