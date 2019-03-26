library(BMT)


### Name: BMT.Psi
### Title: The BMT-Psi Distribution.
### Aliases: BMT.Psi dBMT.Psi pBMT.Psi qBMT.Psi rBMT.Psi

### ** Examples


layout(matrix(1:4, 2, 2))

curve(plogis(x, scale = 1 / 1.70174439), -4, 4, col = "red", lty = 2, ylab = "cdf")
curve(pBMT.Psi(x), add = TRUE, col = "blue", lty = 3)
legend("topleft", legend = c("logis(0, 1 / 1.70174439)","BMT-Psi(0,1)"), 
       bty = "n", col = c("red","blue"), lty = 2:3)

curve(plogis(x, scale = 1 / 1.70174439)-pBMT.Psi(x), -4, 4)

curve(qlogis(x, scale = 1 / 1.70174439), col = "red", lty = 2, xlab = "p", ylab = "qf")
curve(qBMT.Psi(x), add = TRUE, col = "blue", lty = 3)

hist(rBMT.Psi(10000), freq = FALSE, breaks = seq(-4, 4, 0.25), border = "blue")
curve(dlogis(x, scale = 1 / 1.70174439), add = TRUE, col = "red", lty = 2)
curve(dBMT.Psi(x), add = TRUE, col = "blue", lty = 3)



