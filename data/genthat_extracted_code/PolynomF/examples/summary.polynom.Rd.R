library(PolynomF)


### Name: summary.polynom
### Title: Summary, coefficient and prediction methos for polynomial
###   objects.
### Aliases: summary.polynom summary.polylist print.summary.polynom
###   coef.polynom coef.polylist predict.polynom predict.polylist
### Keywords: symbolmath

### ** Examples

x <- polynom()
L <- polylist(1, 1-x)
for(j in 2:10)
  L[[j+1]] <- (2*j - 1 - x)*L[[j]] - (j-1)^2*L[[j-1]]

summary(L[[5]])
predict(L[[5]], x-1)
L[[5]](x-1)

coef(L)




