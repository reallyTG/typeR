library(kergp)


### Name: corLevSymm
### Title: Correlation Matrix for a General Symmetric Correlation Structure
### Aliases: corLevSymm

### ** Examples

checkGrad <- TRUE
nlevels <- 12
npar <- nlevels * (nlevels - 1) / 2
par <- runif(npar, min = 0, max = pi)
##============================================================================
## Compare R and C implementations for 'lowerSQRT = TRUE'
##============================================================================
tR <- system.time(TR <- corLevSymm(nlevels = nlevels,
                                   par = par, lowerSQRT = TRUE, impl = "R"))
tC <- system.time(T <- corLevSymm(nlevels = nlevels, par = par,
                                  lowerSQRT = TRUE))
tC2 <- system.time(T2 <- corLevSymm(nlevels = nlevels, par = par,
                                    lowerSQRT = TRUE, compGrad = FALSE))
## time
rbind(R = tR, C = tC, C2 = tC2)

## results
max(abs(T - TR))
max(abs(T2 - TR))

##============================================================================
## Compare R and C implementations for 'lowerSQRT = FALSE'
##============================================================================
tR <- system.time(TRF <- corLevSymm(nlevels = nlevels, par = par,
                                    lowerSQRT = FALSE, impl = "R"))
tC <- system.time(TCF <- corLevSymm(nlevels = nlevels, par = par,
                                    compGrad = FALSE, lowerSQRT = FALSE))
tC2 <- system.time(TCF2 <- corLevSymm(nlevels = nlevels, par = par,
                                      compGrad = TRUE, lowerSQRT = FALSE))
rbind(R = tR, C = tC, C2 = tC2)
max(abs(TCF - TRF))
max(abs(TCF2 - TRF))

##===========================================================================
## Compare the gradients
##===========================================================================

if (checkGrad) {

    library(numDeriv)

    ##==================
    ## lower SQRT case
    ##==================
    JR <- jacobian(fun = corLevSymm, x = par, nlevels = nlevels,
                   lowerSQRT = TRUE, method = "complex", impl = "R")
    J <- attr(T, "gradient")

    ## redim and compare.
    dim(JR) <- dim(J)
    max(abs(J - JR))
    nG <- length(JR)
    plot(1:nG, as.vector(JR), type = "p", pch = 21, col = "SpringGreen3",
         cex = 0.8, ylim = range(J, JR),
         main = "gradient check, lowerSQRT = TRUE")
    points(x = 1:nG, y = as.vector(J), pch = 16, cex = 0.6, col = "orangered")

    ##==================
    ## Symmetric case
    ##==================
    JR <- jacobian(fun = corLevSymm, x = par, nlevels = nlevels,
                   lowerSQRT = FALSE, impl = "R", method = "complex")
    J <- attr(TCF2, "gradient")

    ## redim and compare.
    dim(JR) <- dim(J)
    max(abs(J - JR))
    nG <- length(JR)
    plot(1:nG, as.vector(JR), type = "p", pch = 21, col = "SpringGreen3",
         cex = 0.8,
         ylim = range(J, JR),
         main = "gradient check, lowerSQRT = FALSE")
    points(x = 1:nG, y = as.vector(J), pch = 16, cex = 0.6, col = "orangered")
}



