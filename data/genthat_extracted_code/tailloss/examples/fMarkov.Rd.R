library(tailloss)


### Name: fMarkov
### Title: Markov Bound.
### Aliases: fMarkov
### Keywords: markov

### ** Examples

data(UShurricane)

# Compress the table to millions of dollars

USh.m <- compressELT(ELT(UShurricane), digits = -6)
EPC.Markov <- fMarkov(USh.m, s = 1:40)
plot(EPC.Markov, type = "l", ylim = c(0, 1))
# Assuming the losses follow a Gamma with E[X] = x, and Var[X] = 2 * x
EPC.Markov.Gamma <- fMarkov(USh.m, s = 1:40, theta = 2, cap = 5)
EPC.Markov.Gamma
plot(EPC.Markov.Gamma, type = "l", ylim = c(0, 1))
# Compare the two results:
plot(EPC.Markov, type = "l", main = "Exceedance Probability Curve", ylim = c(0,1))
lines(EPC.Markov.Gamma, col = 2, lty = 2)
legend("topright", c("Dirac Delta", expression(paste("Gamma(",
alpha[i] == 1 / theta^2, ", ", beta[i] ==1 / (x[i] * theta^2), ")", " cap =", 5))),
lwd = 2, lty = 1:2, col = 1:2)



