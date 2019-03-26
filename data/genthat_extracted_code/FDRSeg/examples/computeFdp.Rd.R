library(FDRSeg)


### Name: computeFdp
### Title: Compute false discovery proportion (FDP)
### Aliases: computeFdp
### Keywords: nonparametric

### ** Examples

# simulate data
set.seed(2)
u0 <- c(rep(1, 50), rep(5, 50))
Y  <- rnorm(100, u0)

# compute FDRSeg
uh <- fdrseg(Y)

plot(Y, pch = 20, col = "grey", xlab = "", ylab = "")
lines(u0, type = "s", col = "blue")
lines(evalStepFun(uh), type = "s", col = "red")
legend("topleft", c("Truth", "FDRSeg"), lty = c(1, 1), col = c("blue", "red"))

# compute false discovery proportion
fdp <- computeFdp(u0, uh$left)
cat("False discovery propostion is ", fdp, "\n")



