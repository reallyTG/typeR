library(adehabitatLT)


### Name: Chi
### Title: The Chi Distribution
### Aliases: chi dchi pchi qchi rchi
### Keywords: distribution

### ** Examples


opar <- par(mfrow = c(2,2))

hist(rchi(100), ncla = 20, main="The Chi distribution")

plot(tutu <- seq(0, 5, length=20), dchi(tutu, df = 2), xlab = "x",
     ylab = "probability density", type = "l")

plot(tutu, pchi(tutu), xlab = "x", ylab = "Repartition function",
     type = "l")

par(opar)




