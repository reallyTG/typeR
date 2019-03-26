library(Renext)


### Name: MixExp2
### Title: Mixture of two exponential distributions
### Aliases: MixExp2 dmixexp2 rmixexp2 pmixexp2 qmixexp2 hmixexp2 Hmixexp2
### Keywords: distribution

### ** Examples

rate1 <- 1.0
rate2 <- 4.0
prob1 <- 0.8
qs <- qmixexp2(p = c(0.99, 0.999), prob1 = prob1,
               rate1 = rate1, rate2 = rate2) 
x <- seq(from = 0, to = qs[2], length.out = 200)
F <- pmixexp2(x, prob1 = prob1, rate1 = rate1, rate2 = rate2)
plot(x, F, type = "l", col = "orangered", lwd = 2,
     main = "Mixexp2 distribution and quantile for p = 0.99")
abline(v = qs[1])
abline(h = 0.99)




