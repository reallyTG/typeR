library(tailloss)


### Name: fPanjer
### Title: Panjer Recursion.
### Aliases: fPanjer
### Keywords: Panjer

### ** Examples

data(UShurricane)

# Compress the table to millions of dollars

USh.m <- compressELT(ELT(UShurricane), digits = -6)

EPC.Panjer <- fPanjer(USh.m, s = 1:40, verbose = TRUE)
EPC.Panjer
plot(EPC.Panjer, type = "l", ylim = c(0,1))
# Assuming the losses follow a Gamma with E[X] = x, and Var[X] = 2 * x and cap = 5m

EPC.Panjer.Gamma <- fPanjer(USh.m, s = 1:40, theta = 2, cap = 5, verbose = TRUE)
EPC.Panjer.Gamma
plot(EPC.Panjer.Gamma, type = "l", ylim = c(0,1))

# Compare the two results:

plot(EPC.Panjer, type = "l", main = 'Exceedance Probability Curve',
ylim = c(0, 1))
lines(EPC.Panjer.Gamma, col = 2, lty = 2)
legend("topright", c("Dirac Delta", expression(paste("Gamma(",
alpha[i] == 1 / theta^2, ", ", beta[i] ==1 / (x[i] * theta^2), ")", " cap =", 5))),
lwd = 2, lty = 1:2, col = 1:2)



