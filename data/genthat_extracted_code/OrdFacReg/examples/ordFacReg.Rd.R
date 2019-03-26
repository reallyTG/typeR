library(OrdFacReg)


### Name: ordFacReg
### Title: Compute least squares or logistic regression for ordered
###   predictors
### Aliases: ordFacReg
### Keywords: regression

### ** Examples


## ========================================================
## To illustrate least squares estimation, we generate the same data
## that was used in Rufibach (2010), Table 1.
## ========================================================

## --------------------------------------------------------
## initialization
## --------------------------------------------------------
n <- 200
Z <- NULL
intercept <- FALSE

## --------------------------------------------------------
## quantitative variables
## --------------------------------------------------------
n.q <- 3
set.seed(14012009)
if (n.q > 0){for (i in 1:n.q){Z <- cbind(Z, rnorm(n, mean = 1, sd = 2))}}

## --------------------------------------------------------
## unordered factors
## --------------------------------------------------------
un.levels <- 3
for (i in 1:length(un.levels)){Z <- cbind(Z, sample(rep(1:un.levels[i], 
    each = ceiling(n / un.levels)))[1:n])}
fact <- n.q + 1:length(un.levels)

## --------------------------------------------------------
## ordered factors
## --------------------------------------------------------
levels <- 8
for (i in 1:length(un.levels)){Z <- cbind(Z, sample(rep(1:levels[i], 
    each = ceiling(n / levels)))[1:n])}
ordfact <- n.q + length(un.levels) + 1:length(levels)

## --------------------------------------------------------
## generate data matrices
## --------------------------------------------------------
Y <- prepareData(Z, fact, ordfact, ordering = NA, intercept)$Y

## --------------------------------------------------------
## generate response
## --------------------------------------------------------
D <- apply(Y * matrix(c(rep(c(2, -3, 0), each = n), rep(c(1, 1), each = n), 
    rep(c(0, 2, 2, 2, 2, 5, 5), each = n)), ncol = ncol(Y)), 1, sum) + 
    rnorm(n, mean = 0, sd = 4)

## --------------------------------------------------------
## compute estimates
## --------------------------------------------------------
res1 <- lmLSE(D, Y)
res2 <- ordFacReg(D, Z, fact, ordfact, ordering = "i", type = "LS", intercept, 
    display = 1, eps = 0)
b1 <- res1$beta
g1 <- lmSS(b1, D, Y)$dL
b2 <- res2$beta
g2 <- lmSS(b2, D, Y)$dL
Ls <- c(lmSS(b1, D, Y)$L, lmSS(b2, D, Y)$L)
names(Ls) <- c("LSE", "ordFact") 
disp <- cbind(1:length(b1), round(cbind(b1, g1, cumsum(g1)), 4), 
    round(cbind(b2, g2, cumsum(g2)), 4))

## --------------------------------------------------------
## display results
## --------------------------------------------------------
disp
Ls

## ========================================================
## Artificial data is used to illustrate logistic regression.
## ========================================================

## --------------------------------------------------------
## initialization
## --------------------------------------------------------
set.seed(1977)
n <- 500
Z <- NULL
intercept <- FALSE

## --------------------------------------------------------
## quantitative variables
## --------------------------------------------------------
n.q <- 2
if (n.q > 0){for (i in 1:n.q){Z <- cbind(Z, rnorm(n, rgamma(2, 2, 1)))}}

## --------------------------------------------------------
## unordered factors
## --------------------------------------------------------
un.levels <- c(8, 2)
for (i in 1:length(un.levels)){Z <- cbind(Z, sample(round(runif(n, 0, 
    un.levels[i] - 1)) + 1))}
fact <- n.q + 1:length(un.levels)

## --------------------------------------------------------
## ordered factors
## --------------------------------------------------------
levels <- c(2, 4, 10)
for (i in 1:length(levels)){Z <- cbind(Z, sample(round(runif(n, 0, 
    levels[i] - 1)) + 1))}
ordfact <- n.q + length(un.levels) + 1:length(levels)

## --------------------------------------------------------
## generate response
## --------------------------------------------------------
D <- sample(c(rep(0, n / 2), rep(1, n/2)))

## --------------------------------------------------------
## generate design matrix
## --------------------------------------------------------
Y <- prepareData(Z, fact, ordfact, ordering = NA, intercept)$Y

## --------------------------------------------------------
## compute estimates
## --------------------------------------------------------
res1 <- matrix(glm.fit(Y, D, family = binomial(link = logit))$coefficients, ncol = 1)
res2 <- ordFacReg(D, Z, fact, ordfact, ordering = NA, type = "logreg", 
    intercept = intercept, display = 1, eps = 0)
b1 <- res1
g1 <- logRegDeriv(b1, D, Y)$dL
b2 <- res2$beta
g2 <- logRegDeriv(b2, D, Y)$dL
Ls <- unlist(c(logRegLoglik(res1, D, Y), res2$L))
names(Ls) <- c("MLE", "ordFact") 
disp <- cbind(1:length(b1), round(cbind(b1, g1, cumsum(g1)), 4), 
    round(cbind(b2, g2, cumsum(g2)), 4))

## --------------------------------------------------------
## display results
## --------------------------------------------------------
disp
Ls

## --------------------------------------------------------
## compute estimates when the third ordered factor should
## have *decreasing* estimated coefficients
## --------------------------------------------------------
res3 <- ordFacReg(D, Z, fact, ordfact, ordering = c("i", "i", "d"), 
    type = "logreg", intercept = intercept, display = 1, eps = 0)
b3 <- res3$beta
g3 <- logRegDeriv(b3, D, Y)$dL
Ls <- unlist(c(logRegLoglik(res1, D, Y), res2$L, res3$L))
names(Ls) <- c("MLE", "ordFact ddd", "ordFact iid") 
disp <- cbind(1:length(b1), round(cbind(b1, b2, b3), 4))

## --------------------------------------------------------
## display results
## --------------------------------------------------------
disp
Ls



