library(weibulltools)


### Name: loglik_profiling
### Title: Log-Likelihood Profile Function for Log-Location-Scale
###   Distributions with Threshold
### Aliases: loglik_profiling

### ** Examples

# Alloy T7987 dataset taken from Meeker and Escobar(1998, p. 131)
cycles   <- c(300, 300, 300, 300, 300, 291, 274, 271, 269, 257, 256, 227, 226,
              224, 213, 211, 205, 203, 197, 196, 190, 189, 188, 187, 184, 180,
              180, 177, 176, 173, 172, 171, 170, 170, 169, 168, 168, 162, 159,
              159, 159, 159, 152, 152, 149, 149, 144, 143, 141, 141, 140, 139,
              139, 136, 135, 133, 131, 129, 123, 121, 121, 118, 117, 117, 114,
              112, 108, 104, 99, 99, 96, 94)
state <- c(rep(0, 5), rep(1, 67))

# Determining threshold parameter for which the log-likelihood is maximized
# subject to the condition that the threshold parameter must be smaller
# as the first failure cycle, i.e 94:
threshold <- seq(0, min(cycles[state == 1]) - 0.1, length.out = 100)
profile_logL <- sapply(threshold, loglik_profiling,
                     x = cycles,
                     event = state,
                     distribution = "weibull3")
threshold[which.max(profile_logL)]

# plot:
# plot(threshold, profile_logL, type = "l")
# abline(v = threshold[which.max(profile_logL)], h = max(profile_logL), col = "red")



