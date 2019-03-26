library(HAC)


### Name: emp.copula
### Title: Empirical copula
### Aliases: emp.copula emp.copula.self

### ** Examples

v = seq(-4, 4, 0.05)
X = cbind(matrix(pt(v, 1), 161, 1), matrix(pnorm(v), 161, 1))

# both methods lead to the same result 
z = emp.copula.self(X, proc = "M") 
which(((emp.copula.self(X[1:100, ], proc = "M") - emp.copula.self(X[1:100, ],
proc = "A")) == 0) == "FALSE")
# integer(0)

# the contour plot
out = outer(z, z)
contour(x = X[,1], y = X[,2], out, main = "Contour Plot", 
xlab = "Cauchy Margin", ylab = "Standard Normal Margin", 
labcex = 1, lwd = 1.5, nlevels = 15)



