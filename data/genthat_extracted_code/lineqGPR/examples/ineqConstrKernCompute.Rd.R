library(lineqGPR)


### Name: ineqConstrKernCompute
### Title: Kernel Matrix for '"lineqDGP"' Models.
### Aliases: ineqConstrKernCompute

### ** Examples

x <- seq(0, 1, 0.01)
par <- c(1, 0.1)
Kb <- ineqConstrKernCompute(x, constrType = "boundedness", kernType = "gaussian", par)
image(Kb, main = "covariance matrix for boundedness constraints")
Km <- ineqConstrKernCompute(x, constrType = "monotonicity", kernType = "gaussian", par)
image(Km, main = "covariance matrix for monotonicity constraints")
Kc <- ineqConstrKernCompute(x, constrType = "convexity", kernType = "gaussian", par)
image(Kc, , main = "covariance matrix for convexity constraints")




