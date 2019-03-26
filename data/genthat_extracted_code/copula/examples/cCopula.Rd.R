library(copula)


### Name: cCopula
### Title: Conditional Distributions and Their Inverses from Copulas
### Aliases: cacopula rtrafo cCopula
### Keywords: distribution

### ** Examples

## 1) Sampling from a conditional distribution of a Clayton copula given u_1

## Define the copula
tau <- 0.5
theta <- iTau(claytonCopula(), tau = tau)
d <- 2
cc <- claytonCopula(theta, dim = d)
n <- 1000
set.seed(271)

## A small u_1
u1 <- 0.05
U <- cCopula(cbind(u1, runif(n)), copula = cc, inverse = TRUE)
plot(U[,2], ylab = quote(U[2]))

## A large u_1
u1 <- 0.95
U <- cCopula(cbind(u1, runif(n)), copula = cc, inverse = TRUE)
plot(U[,2], ylab = quote(U[2]))


## 2) Sample via conditional distribution method and then apply the
##    Rosenblatt transform
##    Note: We choose the numerically more involved (and thus slower)
##          Gumbel case here

## Define the copula
tau <- 0.5
theta <- iTau(gumbelCopula(), tau = tau)
d <- 5
gc <- gumbelCopula(theta, dim = d)
n <- 200
set.seed(271)
U. <- matrix(runif(n*d), ncol = d) # U(0,1)^d

## No test: 
## Transform to Gumbel sample via conditional distribution method
U <- cCopula(U., copula = gc, inverse = TRUE) # slow for ACs except Clayton
splom2(U) # scatter-plot matrix copula sample

## Rosenblatt transform back to U(0,1)^d (as a check)
U. <- cCopula(U, copula = gc)
splom2(U.) # U(0,1)^d again
## End(No test)

## 3) cCopula() for elliptical copulas

tau <- 0.5
theta <- iTau(claytonCopula(), tau = tau)
d <- 5
cc <- claytonCopula(theta, dim = d)
set.seed(271)
n <- 1000
U <- rCopula(n, copula = cc)
X <- qnorm(U) # X now follows a meta-Clayton model with N(0,1) marginals
U <- pobs(X) # build pseudo-observations

fN <- fitCopula(normalCopula(dim = d), data = U) # fit a Gauss copula
U.RN <- cCopula(U, copula = fN@copula)
splom2(U.RN, cex = 0.2) # visible but not so clearly

f.t <- fitCopula(tCopula(dim = d), U)
U.Rt <- cCopula(U, copula = f.t@copula) # transform with a fitted t copula
splom2(U.Rt, cex = 0.2) # still visible but not so clear

## Inverse (and check consistency)
U.N <- cCopula(U.RN, copula = fN @copula, inverse = TRUE)
U.t <- cCopula(U.Rt, copula = f.t@copula, inverse = TRUE)

tol <- 1e-14
stopifnot(
    all.equal(U, U.N),
    all.equal(U, U.t),
    all.equal(log(U.RN),
              cCopula(U, copula = fN @copula, log = TRUE), tolerance = tol),
    all.equal(log(U.Rt),
              cCopula(U, copula = f.t@copula, log = TRUE), tolerance = tol)
)

## 4) cCopula() for a more sophisticated mixture copula (bivariate case only!)

tau <- 0.5
cc <- claytonCopula(iTau(claytonCopula(), tau = tau)) # first mixture component
tc <- tCopula(iTau(tCopula(), tau = tau), df = 3) # t_3 copula
tc90 <- rotCopula(tc, flip = c(TRUE, FALSE)) # t copula rotated by 90 degrees
wts <- c(1/2, 1/2) # mixture weights
mc <- mixCopula(list(cc, tc90), w = wts) # mixture copula with one copula rotated

set.seed(271)
U <- rCopula(n, copula = mc)
U. <- cCopula(U, copula = mc) # Rosenblatt transform back to U(0,1)^2 (as a check)
plot(U., xlab = quote(U*"'"[1]), ylab = quote(U*"'"[2])) # check for uniformity



