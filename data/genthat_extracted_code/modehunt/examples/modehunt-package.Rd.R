library(modehunt)


### Name: modehunt-package
### Title: Multiscale Analysis for Density Functions
### Aliases: modehunt-package modehunt 'mode hunting' multiscale
### Keywords: htest nonparametric

### ** Examples

## generate random sample
set.seed(1977)
n <- 200; a <- 0; b <- 0.5; s <- 2 / (b - a) 
X.raw <- rlin(n, a, b, s)

## input critical values
alpha <- 0.05
data(cvModeAll); data(cvModeApprox); data(cvModeBlock)
cv.all <- cvModeAll[cvModeAll$alpha == alpha & cvModeAll$n == n, 3:4]
cv.approx <- cvModeApprox[cvModeApprox$alpha == alpha & cvModeApprox$n == n, 3:4]
cv.block <- cvModeBlock[cvModeBlock$alpha == alpha & cvModeBlock$n == n, 3:11]

## standard procedure from Duembgen and Walther (2008)
mod1 <- modeHunting(X.raw, lower = 0, upper = 1, cv.all, min.int = TRUE)

## procedure from Rufibach and Walther (2010) based on I_app
mod2 <- modeHuntingApprox(X.raw, lower = 0, upper = 1, 
                          crit.vals = cv.approx, min.int = TRUE)

## block procedure from Rufibach and Walther (2010)
mod3 <- modeHuntingBlock(X.raw, lower = 0, upper = 1, 
                         crit.vals = cv.block, min.int = TRUE)

## display
mod1; mod2; mod3



