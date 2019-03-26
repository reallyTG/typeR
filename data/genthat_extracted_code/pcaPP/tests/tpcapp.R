## this will render the output independent from the version of the package
suppressPackageStartupMessages(library(pcaPP))

##  Sparse loadings
set.seed (0)
##x <- data.Zou()
data(iris)
x <- iris[, 1:4]

l1median_NM (x)$par
l1median_CG (x)$par
l1median_BFGS (x)$par
l1median_NLM (x)$par
l1median_HoCr (x)$par
l1median_VaZh (x)$par

# compare with coordinate-wise median:
apply(x,2,median)

pc <- PCAgrid(x)
pc
summary(pc)
pc$loadings
pc$scores
