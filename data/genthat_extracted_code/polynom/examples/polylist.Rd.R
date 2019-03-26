library(polynom)


### Name: polylist
### Title: Lists of Polynomials
### Aliases: polylist as.polylist is.polylist [.polylist c.polylist
###   deriv.polylist integral.polylist plot.polylist print.polylist
###   rep.polylist unique.polylist
### Keywords: symbolmath

### ** Examples

## Calculate orthogonal polynomials
pl <- poly.orth(rep(1:4, 1:4), 3)
pl
plot(pl)
deriv(pl)
integral(pl)
sum(pl)
prod(pl)
unique(rep(pl, 3)[c(8, 12)])



