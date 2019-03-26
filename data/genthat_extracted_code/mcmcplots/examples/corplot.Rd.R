library(mcmcplots)


### Name: corplot
### Title: Plot a Correlation Matrix
### Aliases: corplot
### Keywords: hplot

### ** Examples

Rho <- matrix(c(
 1.00,  0.35, -0.65, -0.66,  0.46,  0.42,
 0.35,  1.00, -0.69, -0.64,  0.40, -0.06,
-0.65, -0.69,  1.00,  0.70, -0.57, -0.11,
-0.66, -0.64,  0.70,  1.00, -0.15, -0.10,
 0.46,  0.40, -0.57, -0.15,  1.00,  0.18,
 0.42, -0.06, -0.11, -0.10,  0.18,  1.00), 6, 6)
dimnames(Rho) <- list(paste("rho[", 1:6, "]", sep=""), paste("rho[", 1:6, "]", sep=""))
corplot(Rho)
corplot(Rho, greek=TRUE)



