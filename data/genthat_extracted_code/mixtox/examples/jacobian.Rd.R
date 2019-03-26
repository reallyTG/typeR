library(mixtox)


### Name: jacobian
### Title: Jacobian Matrix Calculation
### Aliases: jacobian
### Keywords: Jacobian matrix

### ** Examples

## example 1
x <- cytotox$Ni$x
rspn <- cytotox$Ni$y
obj <- curveFit(x, rspn, eq = 'Logit', param = c(12, 3), effv = c(0.05, 0.5), rtype = 'quantal')
jacobian('Logit', x, obj$p)




