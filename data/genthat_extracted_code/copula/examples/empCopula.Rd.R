library(copula)


### Name: empCopula
### Title: The Empirical Copula
### Aliases: F.n dCn C.n empCopula Cn toEmpMargins
### Keywords: multivariate

### ** Examples

## Generate data X (from a meta-Gumbel model with N(0,1) margins)
n <- 100
d <- 3
family <- "Gumbel"
theta <- 2
cop <- onacopulaL(family, list(theta=theta, 1:d))
set.seed(1)
X <- qnorm(rCopula(n, cop)) # meta-Gumbel data with N(0,1) margins

## Evaluate empirical copula
u <- matrix(runif(n*d), n, d) # random points were to evaluate the empirical copula
ec <- C.n(u, X = X)

## Compare the empirical copula with the true copula
pc <- pCopula(u, copula = cop)
mean(abs(pc - ec)) # ~= 0.012 -- increase n to decrease this error

## The same for the two smoothed versions
beta <- C.n(u, X, smoothing = "beta")
mean(abs(pc - beta))
check <- C.n(u, X, smoothing = "checkerboard")
mean(abs(pc - check))

## Compare the empirical copula with F.n(pobs())
U <- pobs(X) # pseudo-observations
stopifnot(identical(ec, F.n(u, X = pobs(U)))) # even identical

## Compare the empirical copula based on U at U with the Kendall distribution
## Note: Theoretically, C(U) ~ K, so K(C_n(U, U = U)) should approximately be U(0,1)
plot(ecdf(pK(C.n(U, X), cop = cop@copula, d = d)), asp = 1, xaxs="i", yaxs="i")
segments(0,0, 1,1, col=adjustcolor("blue",1/3), lwd=5, lty = 2)
abline(v=0:1, col="gray70", lty = 2)

## Compare the empirical copula and the true copula on the diagonal
C.n.diag <- function(u) C.n(do.call(cbind, rep(list(u), d)), X = X) # diagonal of C_n
C.diag <- function(u) pCopula(do.call(cbind, rep(list(u), d)), cop) # diagonal of C
curve(C.n.diag, from = 0, to = 1, # empirical copula diagonal
      main = paste("True vs empirical diagonal of a", family, "copula"),
      xlab = "u", ylab = quote("True C(u,..,u) and empirical"~C[n](u,..,u)))
curve(C.diag, lty = 2, add = TRUE) # add true copula diagonal
legend("bottomright", lty = 2:1, bty = "n", inset = 0.02,
       legend = expression(C, C[n]))

## Approximate partial derivatives w.r.t. the 2nd and 3rd component
j.ind <- 2:3 # indices w.r.t. which the partial derivatives are computed
## Partial derivatives based on the empirical copula and the true copula
der23 <- dCn(u, U = pobs(U), j.ind = j.ind)
der23. <- copula:::dCdu(archmCopula(family, param=theta, dim=d), u=u)[,j.ind]
## Approximation error
summary(as.vector(abs(der23-der23.)))
## Don't show: 
  U <- U[1:64 ,]# such that m != n
  stopifnot(suppressWarnings( ## deprecation warning ..
    identical(C.n(u, U),
              Cn (U, u))))
## End(Don't show)
## For an example of using F.n(), see help(mvdc)% ./Mvdc.Rd

## Generate a bivariate empirical copula object (various smoothing methods)
n <- 10 # sample size
d <- 2 # dimension
set.seed(271)
X <- rCopula(n, copula = claytonCopula(3, dim = d))
ecop.orig  <- empCopula(X) # smoothing = "none"
ecop.beta  <- empCopula(X, smoothing = "beta")
ecop.check <- empCopula(X, smoothing = "checkerboard")

## Plot
wireframe2(ecop.orig,  FUN = pCopula, draw.4.pCoplines = FALSE)
wireframe2(ecop.beta,  FUN = pCopula)
wireframe2(ecop.check, FUN = pCopula)
## Density (only exists when smoothing = "beta")
wireframe2(ecop.beta,  FUN = dCopula)

## Transform a copula sample to empirical margins
set.seed(271)
X <- qexp(rCopula(1000, copula = claytonCopula(2))) # multivariate distribution
U <- rCopula(917, copula = gumbelCopula(2)) # new copula sample
X. <- toEmpMargins(U, x = X) # tranform U to the empirical margins of X
plot(X.) # Gumbel sample with empirical margins of X



