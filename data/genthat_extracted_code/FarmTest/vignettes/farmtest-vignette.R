## ----gh-installation, eval = FALSE---------------------------------------
#  install.packages("devtools")
#  devtools::install_github("kbose28/FarmTest")
#  library(FarmTest)

## ------------------------------------------------------------------------
library(FarmTest)
set.seed(100)
p = 100
n = 50
epsilon = matrix(rnorm( p*n, 0,1), nrow = n)
B = matrix(runif(p*3,-2,2), nrow=p)
fx = matrix(rnorm(3*n, 0,1), nrow = n)
mu = rep(0, p)
mu[1:5] = 2
X = rep(1,n)%*%t(mu)+fx%*%t(B)+ epsilon
output = farm.test(X, cv=FALSE)#robust, no cross-validation
output

## ------------------------------------------------------------------------
##examples of other robustification options
output = farm.test(X, robust = FALSE, verbose=FALSE) #non-robust
output = farm.test(X, tau = 3, cv=FALSE, verbose=FALSE) #robust, no cross-validation, specified tau
#output = farm.test(X) #robust, cross-validation, longer running

## ------------------------------------------------------------------------
output = farm.test(X, alpha = 0.01,alternative = "greater")
output
names(output)
print(output$rejected)
hist(output$means, 10, main = "Estimated Means", xlab = "")

## ------------------------------------------------------------------------
n2 = 25
epsilon = matrix(rnorm( p*n2, 0,1), nrow = n2)
B = matrix(rnorm(p*3,0,1), nrow=p)
fy = matrix(rnorm(3*n2, 0,1), nrow = n2)
Y = fy%*%t(B)+ epsilon
output = farm.test(X=X,Y=Y)
output
print(output$rejected)
names(output$means)

## ------------------------------------------------------------------------
output = farm.scree(X, K.factors = 15, K.scree = 10, show.plot = TRUE)
output
plot(output, scree.plot=FALSE, col="blue", main="Customized plot")

## ------------------------------------------------------------------------
set.seed(100)
Y = matrix(rnorm(1000, 0, 1),10)
pval = apply(Y, 1, function(x) t.test(x)$p.value)
output = farm.FDR(pval)
output$rejected

## ------------------------------------------------------------------------
muhat = farm.mean(X)
covhat = farm.cov(X)

