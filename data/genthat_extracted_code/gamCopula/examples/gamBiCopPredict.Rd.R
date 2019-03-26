library(gamCopula)


### Name: gamBiCopPredict
### Title: Predict method of a Generalized Additive model for the copula
###   parameter or Kendall's tau
### Aliases: gamBiCopPredict

### ** Examples

require(copula) 
set.seed(0)

## Simulation parameters (sample size, correlation between covariates,
## Clayton copula family)
n <- 5e2
rho <- 0.5
fam <- 1

## A calibration surface depending on three variables
eta0 <- 1
calib.surf <- list(
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

## 3-dimensional matrix X of covariates
covariates.distr <- mvdc(normalCopula(rho, dim = 3),
                                 c("unif"), list(list(min = 0, max = 1)),
                                 marginsIdentical = TRUE)
X <- rMvdc(n, covariates.distr)
colnames(X) <- paste("x",1:3,sep="")

## U in [0,1]x[0,1] with copula parameter depending on X
U <- condBiCopSim(fam, function(x1,x2,x3) {eta0+sum(mapply(function(f,x)
  f(x), calib.surf, c(x1,x2,x3)))}, X[,1:3], par2 = 6, return.par = TRUE)

## Merge U and X
data <- data.frame(U$data,X)
names(data) <- c(paste("u",1:2,sep=""),paste("x",1:3,sep=""))

## Model fit with penalized cubic splines (via min GCV)
basis <- c(3, 10, 10)
formula <- ~s(x1, k = basis[1], bs = "cr") + 
  s(x2, k = basis[2], bs = "cr") + 
  s(x3, k = basis[3], bs = "cr")
system.time(fit <- gamBiCopFit(data, formula, fam))

## Extract the gamBiCop objects and show various methods
(res <- fit$res)
EDF(res)
pred <- gamBiCopPredict(fit$res, X, target = c("calib", "par", "tau"))




