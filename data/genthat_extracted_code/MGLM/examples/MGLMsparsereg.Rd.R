library(MGLM)


### Name: MGLMsparsereg
### Title: Fit multivariate GLM sparse regression
### Aliases: MGLMsparsereg MGLMsparsereg.fit
### Keywords: regression

### ** Examples

## Generate Dirichlet Multinomial data
dist <- "DM"
n <- 100
p <- 15
d <- 5
m <- runif(n, min=0, max=25) + 25
set.seed(134)
X <- matrix(rnorm(n*p),n, p)
alpha <- matrix(0, p, d)
alpha[c(1,3, 5), ] <- 1
Alpha <- exp(X%*%alpha)
Y <- rdirmn(size=m, alpha=Alpha)

## Tuning
ngridpt <- 10
p <- ncol(X)
d <- ncol(Y)
pen <- 'nuclear'
spfit <- MGLMsparsereg(formula=Y~0+X, dist=dist, lambda=Inf, penalty=pen)




