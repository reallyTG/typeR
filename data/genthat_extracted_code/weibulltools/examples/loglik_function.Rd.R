library(weibulltools)


### Name: loglik_function
### Title: Log-Likelihood Function for (Log-) Location-Scale Distributions
###   (with Threshold)
### Aliases: loglik_function

### ** Examples

# Alloy T7987 dataset taken from Meeker and Escobar(1998, p. 131)
cycles   <- c(300, 300, 300, 300, 300, 291, 274, 271, 269, 257, 256, 227, 226,
              224, 213, 211, 205, 203, 197, 196, 190, 189, 188, 187, 184, 180,
              180, 177, 176, 173, 172, 171, 170, 170, 169, 168, 168, 162, 159,
              159, 159, 159, 152, 152, 149, 149, 144, 143, 141, 141, 140, 139,
              139, 136, 135, 133, 131, 129, 123, 121, 121, 118, 117, 117, 114,
              112, 108, 104, 99, 99, 96, 94)
state <- c(rep(0, 5), rep(1, 67))

# Example 1: Evaluating Log-Likelihood function of two-parametric weibull:
loglik_weib <- loglik_function(x = cycles, event = state, pars = c(5.29, 0.33),
                               distribution = "weibull")

# Example 2: Evaluating Log-Likelihood function of three-parametric weibull:
loglik_weib3 <- loglik_function(x = cycles, event = state,
                                pars = c(4.54, 0.76, 92.99),
                                distribution = "weibull3")



