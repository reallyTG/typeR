library(funData)


### Name: eVal
### Title: Generate a sequence of simulated eigenvalues
### Aliases: eVal

### ** Examples

oldpar <- par(no.readonly = TRUE)

# simulate M = 10 eigenvalues
M <- 10
eLin <- eVal(M = M, type = "linear")
eExp <- eVal(M = M, type = "exponential")
eWien <- eVal(M = M, type = "wiener")

par(mfrow = c(1,1))
plot(1:M, eLin, pch = 20, xlab = "m", ylab = expression(nu[m]), ylim = c(0,1))
points(1:M, eExp, pch = 20, col = 3)
points(1:M, eWien, pch = 20, col = 4)
legend("topright", legend = c("linear", "exponential", "wiener"), pch = 20, col = c(1,3,4))

par(oldpar)



