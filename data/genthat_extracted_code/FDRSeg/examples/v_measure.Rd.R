library(FDRSeg)


### Name: v_measure
### Title: Compute V-measure
### Aliases: v_measure
### Keywords: nonparametric

### ** Examples

# simulate data
u0 <- c(rep(1, 50), rep(5, 50))
Y  <- rnorm(100, u0)

# compute FDRSeg
uh <- fdrseg(Y)

plot(Y, pch = 20, col = "grey", xlab = "", ylab = "")
lines(u0, type = "s", col = "blue")
lines(evalStepFun(uh), type = "s", col = "red")
legend("topleft", c("Truth", "FDRSeg"), lty = c(1, 1), col = c("blue", "red"))

# compute V-measure
vm <- v_measure(u0, evalStepFun(uh))
print(vm)



