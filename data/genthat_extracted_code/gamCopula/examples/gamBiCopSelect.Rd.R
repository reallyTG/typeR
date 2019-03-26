library(gamCopula)


### Name: gamBiCopSelect
### Title: Selection and Maximum penalized likelihood estimation of a
###   Generalized Additive model (gam) for the copula parameter or
###   Kendall's tau.
### Aliases: gamBiCopSelect

### ** Examples

require(copula)
set.seed(0)

## Simulation parameters (sample size, correlation between covariates,
## Student copula with 4 degrees of freedom)
n <- 5e2
rho <- 0.9
fam <- 2
par2 <- 4

## A calibration surface depending on four variables
eta0 <- 1
calib.surf <- list(calib.lin <- function(t, Ti = 0, Tf = 1, b = 2) {
    return(-2+4*t)},
  calib.quad <- function(t, Ti = 0, Tf = 1, b = 8) {
    Tm <- (Tf - Ti)/2
    a <- -(b/3) * (Tf^2 - 3 * Tf * Tm + 3 * Tm^2)
  return(a + b * (t - Tm)^2)},
  calib.sin <- function(t, Ti = 0, Tf = 1, b = 1, f = 1) {
    a <- b * (1 - 2 * Tf * pi/(f * Tf * pi +
                                 cos(2 * f * pi * (Tf - Ti))
                               - cos(2 * f * pi * Ti)))
    return((a + b)/2 + (b - a) * sin(2 * f * pi * (t - Ti))/2)},
  calib.exp <- function(t, Ti = 0, Tf = 1, b = 2, s = Tf/8) {
    Tm <- (Tf - Ti)/2
    a <- (b * s * sqrt(2 * pi)/Tf) * (pnorm(0, Tm, s) - pnorm(Tf, Tm, s))
    return(a + b * exp(-(t - Tm)^2/(2 * s^2)))})

## 6-dimensional matrix X of covariates
covariates.distr <- mvdc(normalCopula(rho, dim = 6),
                                 c("unif"), list(list(min = 0, max = 1)),
                                 marginsIdentical = TRUE)
X <- rMvdc(n, covariates.distr)
colnames(X) <- paste("x",1:6,sep="")

## U in [0,1]x[0,1] depending on the four first columns of X
U <- condBiCopSim(fam, function(x1,x2,x3,x4) {eta0+sum(mapply(function(f,x)
  f(x), calib.surf, c(x1,x2,x3,x4)))}, X[,1:4], par2 = 4, return.par = TRUE)

## Not run: 
##D ## Selection using AIC (about 30sec on single core) 
##D ## Use parallel = TRUE to speed-up....
##D system.time(best <- gamBiCopSelect(U$data, smooth.covs = X))
##D print(best$res)
##D EDF(best$res) ## The first function is linear
##D ## Plot only the smooth component
##D par(mfrow=c(2,2))
##D plot(best$res)
## End(Not run)



