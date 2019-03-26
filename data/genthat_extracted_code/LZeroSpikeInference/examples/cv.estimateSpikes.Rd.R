library(LZeroSpikeInference)


### Name: cv.estimateSpikes
### Title: Cross-validate and optimize model parameters
### Aliases: cv.estimateSpikes

### ** Examples

# Not run
# sim <- simulateAR1(n = 500, gam = 0.998, poisMean = 0.009, sd = 0.05, seed = 1)
# plot(sim)

# AR(1) model
# outAR1 <- cv.estimateSpikes(sim$fl, type = "ar1")
# plot(outAR1)
# print(outAR1)
# fit <- estimateSpikes(sim$fl, gam = outAR1$optimalGam[outAR1$index1SE, 1],
# lambda = outAR1$lambda1SE, type = "ar1")
# plot(fit)
# print(fit)

# AR(1) + intercept model
# outAR1Intercept <- cv.estimateSpikes(sim$fl, type = "intercept",
# lambdas = seq(0.1, 5, length.out = 10))
# plot(outAR1Intercept)
# print(outAR1Intercept)
# fit <- estimateSpikes(sim$fl, gam = outAR1Intercept$optimalGam[outAR1Intercept$index1SE, 1],
# lambda = outAR1Intercept$lambda1SE, type = "intercept")
# plot(fit)
# print(fit)



