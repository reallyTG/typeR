library(OrdFacReg)


### Name: ordFacRegCox
### Title: Compute Cox-regression for ordered predictors
### Aliases: ordFacRegCox
### Keywords: regression

### ** Examples


## ========================================================
## Artificial data is used to illustrate Cox-regression.
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
un.levels <- c(8, 2)[2]
for (i in 1:length(un.levels)){Z <- cbind(Z, sample(round(runif(n, 0, 
    un.levels[i] - 1)) + 1))}
fact <- n.q + 1:length(un.levels)

## --------------------------------------------------------
## ordered factors
## --------------------------------------------------------
levels <- c(4, 5, 10)
for (i in 1:length(levels)){Z <- cbind(Z, sample(round(runif(n, 0, 
    levels[i] - 1)) + 1))}
ordfact <- n.q + length(un.levels) + 1:length(levels)

## --------------------------------------------------------
## generate response
## --------------------------------------------------------
ttf <- rexp(n)
tf <- round(runif(n))

## --------------------------------------------------------
## generate design matrix
## --------------------------------------------------------
Y <- prepareData(Z, fact, ordfact, ordering = NA, intercept)$Y

## --------------------------------------------------------
## compute estimates
## --------------------------------------------------------
res1 <- eha::coxreg.fit(Y, Surv(ttf, tf), max.survs = length(tf), 
    strats = rep(1, length(tf)))$coefficients
res2 <- ordFacRegCox(ttf, tf, Z, fact, ordfact, ordering = NA, 
    intercept = intercept, display = 1, eps = 0)
b1 <- matrix(res1, ncol = 1)
g1 <- coxDeriv(b1, ttf, tf, Y)$dL
b2 <- res2$beta
g2 <- coxDeriv(b2, ttf, tf, Y)$dL
Ls <- c(coxLoglik(b1, ttf, tf, Y)$L, res2$L)
names(Ls) <- c("MLE", "ordFact") 
disp <- cbind(1:length(b1), round(cbind(b1, g1, cumsum(g1)), 4), 
    round(cbind(b2, g2, cumsum(g2)), 4))

## --------------------------------------------------------
## display results
## --------------------------------------------------------
disp
Ls



