library(BMT)


### Name: BMT.Phi
### Title: The BMT-Phi Distribution.
### Aliases: BMT.Phi dBMT.Phi pBMT.Phi qBMT.Phi rBMT.Phi

### ** Examples


layout(matrix(1:4,2,2))

curve(pnorm(x), -4, 4, col = "red", lty = 2, ylab = "cdf")
curve(pBMT.Phi(x), add = TRUE, col = "blue", lty = 3)
legend("topleft", legend = c("norm(0,1)","BMT-Phi(0,1)"), 
       bty = "n", col = c("red","blue"), lty = 2:3)

curve(pnorm(x)-pBMT.Phi(x), -4, 4)

curve(qnorm(x), col = "red", lty = 2, xlab = "p", ylab = "qf")
curve(qBMT.Phi(x), add = TRUE, col = "blue", lty = 3)

hist(rBMT.Phi(10000), freq = FALSE, breaks = seq(-4,4,0.25), border = "blue")
curve(dnorm(x), add = TRUE, col = "red", lty = 2)
curve(dBMT.Phi(x), add = TRUE, col = "blue", lty = 3)



