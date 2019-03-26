library(robustlmm)


### Name: psi-functions
### Title: Classical, Huber and smoothed Huber psi- or rho-functions
### Aliases: psi-functions cPsi huberPsiRcpp smoothPsi

### ** Examples

plot(cPsi)
plot(huberPsiRcpp)
plot(smoothPsi)
curve(cPsi@psi(x), -3, 3)
curve(smoothPsi@psi(x), -3, 3, add=TRUE, col="red")
curve(huberPsiRcpp@psi(x), -3, 3, add=TRUE, col="blue")



