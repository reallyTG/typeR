library(tailloss)


### Name: fMoment
### Title: Moment Bound.
### Aliases: fMoment
### Keywords: bound moment

### ** Examples

data(UShurricane)

# Compress the table to millions of dollars

USh.m <- compressELT(ELT(UShurricane), digits = -6)
EPC.Moment <- fMoment(USh.m, s = 1:40)
EPC.Moment
plot(EPC.Moment, type = "l", ylim = c(0, 1))
# Assuming the losses follow a Gamma with E[X] = x, and Var[X] = 2 * x
EPC.Moment.Gamma <- fMoment(USh.m, s = 1:40, theta = 2, cap = 5)
EPC.Moment.Gamma
plot(EPC.Moment.Gamma, type = "l", ylim = c(0, 1))
# Compare the two results:
plot(EPC.Moment, type = "l", main = "Exceedance Probability Curve", ylim = c(0, 1))
lines(EPC.Moment.Gamma, col = 2, lty = 2)
legend("topright", c("Dirac Delta", expression(paste("Gamma(",
alpha[i] == 1 / theta^2, ", ", beta[i] ==1 / (x[i] * theta^2), ")", " cap =", 5))),
lwd = 2, lty = 1:2, col = 1:2)



