library(weibulltools)


### Name: r_squared_profiling
### Title: R²-Profile Function for Log-Location-Scale Distributions with
###   Threshold
### Aliases: r_squared_profiling

### ** Examples

# Alloy T7987 dataset taken from Meeker and Escobar(1998, p. 131)
cycles   <- c(300, 300, 300, 300, 300, 291, 274, 271, 269, 257, 256, 227, 226,
              224, 213, 211, 205, 203, 197, 196, 190, 189, 188, 187, 184, 180,
              180, 177, 176, 173, 172, 171, 170, 170, 169, 168, 168, 162, 159,
              159, 159, 159, 152, 152, 149, 149, 144, 143, 141, 141, 140, 139,
              139, 136, 135, 133, 131, 129, 123, 121, 121, 118, 117, 117, 114,
              112, 108, 104, 99, 99, 96, 94)
state <- c(rep(0, 5), rep(1, 67))

df_john <- johnson_method(x = cycles, event = state)

# Determining threshold parameter for which the coefficient of determination is
# maximized subject to the condition that the threshold parameter must be smaller
# as the first failure cycle, i.e 94:
threshold <- seq(0, min(cycles[state == 1]) - 0.1, length.out = 100)
profile_r2 <- sapply(threshold, r_squared_profiling,
                     x = df_john$characteristic[df_john$status == 1],
                     y = df_john$prob[df_john$status == 1],
                     distribution = "weibull3")
threshold[which.max(profile_r2)]

# plot:
# plot(threshold, profile_r2, type = "l")
# abline(v = threshold[which.max(profile_r2)], h = max(profile_r2), col = "red")



