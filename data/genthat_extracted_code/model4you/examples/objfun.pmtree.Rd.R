library(model4you)


### Name: objfun.pmtree
### Title: Objective function of a given pmtree
### Aliases: objfun.pmtree

### ** Examples

## generate data
set.seed(2)
n <- 1000
trt <- factor(rep(1:2, each = n/2))
age <- sample(40:60, size = n, replace = TRUE)
eff <- -1 + I(trt == 2) + 1 * I(trt == 2) * I(age > 50)
expit <- function(x) 1/(1 + exp(-x))
success <- rbinom(n = n, size = 1, prob = expit(eff))
dat <- data.frame(success, trt, age)

## compute base model
bmod1 <- glm(success ~ trt, data = dat, family = binomial)

## copmute tree
(tr1 <- pmtree(bmod1, data = dat))

## compute log-Likelihood
logLik(tr1)
objfun(tr1, newdata = dat, sum = TRUE)
objfun(tr1, sum = TRUE)

## log-Likelihood contributions of first 
## 5 observations
nd <- dat[1:5, ]
objfun(tr1, newdata = nd)



