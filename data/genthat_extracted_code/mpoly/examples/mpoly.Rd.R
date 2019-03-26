library(mpoly)


### Name: mpoly
### Title: Multivariate polynomials in R.
### Aliases: mpoly package-mpoly mpoly-package

### ** Examples

list <- list(
  c(x = 1, coef = 1, y = 0),
  c(x = 0, y = 1, coef = 2),  
  c(y = 1, coef = -6),  
  c(z = 1, coef = -3, x = 2),  
  c(x = 1, coef = 0, x = 3),
  c(t = 1, coef = 4, t = 2, y = 4),
  c(x = 1),
  c(x = 1),
  c(coef = 5),
  c(coef = 5),
  c(coef = -5)
)

mpoly(list) # 3 x  -  4 y  -  3 x^2 z  +  4 y^4 t^3  +  5
mpoly(list, varorder = c("y", "z", "t", "x"))

list <- list(  c(x = 5, x = 2, coef = 5, coef = 6, y = 0) )
mpoly(list)





