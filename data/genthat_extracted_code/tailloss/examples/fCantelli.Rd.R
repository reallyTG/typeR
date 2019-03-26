library(tailloss)


### Name: fCantelli
### Title: Cantelli Bound.
### Aliases: fCantelli
### Keywords: cantelli

### ** Examples

data(UShurricane)

# Compress the table to millions of dollars

USh.m <- compressELT(ELT(UShurricane), digits = -6)
EPC.Cantelli  <- fCantelli(USh.m, s = 1:40)
plot(EPC.Cantelli, type = "l", ylim = c(0, 1))
# Assuming the losses follow a Gamma with E[X] = x, and Var[X] = 2 * x
EPC.Cantelli.Gamma  <- fCantelli(USh.m, s = 1:40, theta = 2, cap = 25)
EPC.Cantelli.Gamma
plot(EPC.Cantelli.Gamma, type = "l")
# Compare the two results:
plot(EPC.Cantelli, type = "l", main = "Exceedance Probability Curve", ylim = c(0, 1))
lines(EPC.Cantelli.Gamma, col = 2, lty = 2)
legend("topright", c("Dirac Delta", expression(paste("Gamma(",
alpha[i] == 1 / theta^2, ", ", beta[i] ==1 / (x[i] * theta^2), ")", " cap =", 5))),
lwd = 2, lty = 1:2, col = 1:2)



