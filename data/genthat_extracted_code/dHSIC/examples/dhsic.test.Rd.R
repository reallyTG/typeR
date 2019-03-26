library(dHSIC)


### Name: dhsic.test
### Title: Independence test based on dHSIC
### Aliases: dhsic.test
### Keywords: htest nonparametric

### ** Examples

### pairwise independent but not jointly independent (pairwise HSIC vs dHSIC)
set.seed(0)
x <- matrix(rbinom(100,1,0.5),ncol=1)
y <- matrix(rbinom(100,1,0.5),ncol=1)
z <- matrix(as.numeric((x+y)==1)+rnorm(100),ncol=1)
X <- list(x,y,z)

dhsic.test(X, method="permutation",
           kernel=c("discrete", "discrete", "gaussian"),
           pairwise=TRUE, B=1000)$p.value
dhsic.test(X, method="permutation",
           kernel=c("discrete", "discrete", "gaussian"),
           pairwise=FALSE, B=1000)$p.value




