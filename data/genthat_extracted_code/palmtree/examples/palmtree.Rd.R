library(palmtree)


### Name: palmtree
### Title: Partially Additive (Generalized) Linear Model Trees
### Aliases: palmtree print.palmtree plot.palmtree coef.palmtree
###   logLik.palmtree predict.palmtree
### Keywords: tree

### ** Examples

## one DGP from Sies and Van Mechelen (2015)
dgp <- function(nobs = 1000, nreg = 5, creg = 0.4, ptreat = 0.5, sd = 1,
  coef = c(1, 0.25, 0.25, 0, 0, -0.25), eff = 1)
{
  d <- mvtnorm::rmvnorm(nobs,
    mean = rep(0, nreg),
    sigma = diag(1 - creg, nreg) + creg)
  colnames(d) <- paste0("x", 1:nreg)
  d <- as.data.frame(d)
  d$a <- rbinom(nobs, size = 1, prob = ptreat)
  d$err <- rnorm(nobs, mean = 0, sd = sd)

  gopt <- function(d) {
    as.numeric(d$x1 > -0.545) * as.numeric(d$x2 < 0.545)
  }
  d$y <- coef[1] + drop(as.matrix(d[, paste0("x", 1:5)]) %*% coef[-1]) -
    eff * (d$a - gopt(d))^2 + d$err
  d$a <- factor(d$a)
  return(d)
}
set.seed(1)
d <- dgp()

## estimate PALM tree with correctly specified global (partially
## additive) regressors and all variables considered for partitioning
palm <- palmtree(y ~ a | x1 + x2 + x5 | x1 + x2 + x3 + x4 + x5, data = d)
print(palm)
plot(palm)

## query coefficients
coef(palm, model = "tree")
coef(palm, model = "palm")
coef(palm, model = "all")



