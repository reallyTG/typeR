library(kergp)


### Name: corLevCompSymm
### Title: Correlation Matrix for the Compound Symmetry Structure
### Aliases: corLevCompSymm

### ** Examples

checkGrad <- TRUE
lowerSQRT <- FALSE
nlevels <- 12
set.seed(1234)
par <- runif(1L, min = 0, max = pi)

##============================================================================
## Compare R and C implementations for 'lowerSQRT = TRUE'
##============================================================================
tR <- system.time(TR <- corLevCompSymm(nlevels = nlevels, par = par,
                                       lowerSQRT = lowerSQRT, impl = "R"))
tC <- system.time(T <- corLevCompSymm(nlevels = nlevels, par = par,
                                      lowerSQRT = lowerSQRT))
tC2 <- system.time(T2 <- corLevCompSymm(nlevels = nlevels, par = par,
                                        lowerSQRT = lowerSQRT, compGrad = FALSE))
## time
rbind(R = tR, C = tC, C2 = tC2)

## results
max(abs(T - TR))
max(abs(T2 - TR))

##===========================================================================
## Compare the gradients
##===========================================================================

if (checkGrad) {

    library(numDeriv)

    ##=======================
    ## lower SQRT case only
    ##========================
    JR <- jacobian(fun = corLevCompSymm, x = par, nlevels = nlevels,
                   lowerSQRT = lowerSQRT, impl = "R", method = "complex")
    J <- attr(T, "gradient")

    ## redim and compare.
    dim(JR) <- dim(J)
    max(abs(J - JR))
    nG <- length(JR)
    plot(1:nG, as.vector(JR), type = "p", pch = 21, col = "SpringGreen3",
         cex = 0.8, ylim = range(J, JR),
         main = paste("gradient check, lowerSQRT =", lowerSQRT))
    points(x = 1:nG, y = as.vector(J), pch = 16, cex = 0.6, col = "orangered")
}




