library(AER)


### Name: Equipment
### Title: Transportation Equipment Manufacturing Data
### Aliases: Equipment
### Keywords: datasets

### ** Examples

## Greene (2003), Example 17.5
data("Equipment")

## Cobb-Douglas
fm_cd <- lm(log(valueadded/firms) ~ log(capital/firms) + log(labor/firms), data = Equipment)

## generalized Cobb-Douglas with Zellner-Revankar trafo
GCobbDouglas <- function(theta)
 lm(I(log(valueadded/firms) + theta * valueadded/firms) ~ log(capital/firms) + log(labor/firms), 
     data = Equipment)

## yields classical Cobb-Douglas for theta = 0
fm_cd0 <- GCobbDouglas(0)

## ML estimation of generalized model
## choose starting values from classical model
par0 <- as.vector(c(coef(fm_cd0), 0, mean(residuals(fm_cd0)^2)))

## set up likelihood function
nlogL <- function(par) {
  beta <- par[1:3]
  theta <- par[4]
  sigma2 <- par[5]

  Y <- with(Equipment, valueadded/firms)
  K <- with(Equipment, capital/firms)
  L <- with(Equipment, labor/firms)

  rhs <- beta[1] + beta[2] * log(K) + beta[3] * log(L)
  lhs <- log(Y) + theta * Y

  rval <- sum(log(1 + theta * Y) - log(Y) +
    dnorm(lhs, mean = rhs, sd = sqrt(sigma2), log = TRUE))
  return(-rval)
}

## optimization
opt <- optim(par0, nlogL, hessian = TRUE)

## Table 17.2
opt$par
sqrt(diag(solve(opt$hessian)))[1:4]
-opt$value

## re-fit ML model
fm_ml <- GCobbDouglas(opt$par[4])
deviance(fm_ml)
sqrt(diag(vcov(fm_ml)))

## fit NLS model
rss <- function(theta) deviance(GCobbDouglas(theta))
optim(0, rss)
opt2 <- optimize(rss, c(-1, 1))
fm_nls <- GCobbDouglas(opt2$minimum)
-nlogL(c(coef(fm_nls), opt2$minimum, mean(residuals(fm_nls)^2)))



