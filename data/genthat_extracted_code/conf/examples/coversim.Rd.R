library(conf)


### Name: coversim
### Title: Confidence Region Coverage
### Aliases: coversim
### Keywords: Estimation, Graphical Methods, Numerical Optimization
###   Parameter confidence coverage data graphics, intervals, region,
###   statistical visualization,

### ** Examples

## assess actual coverage at various alpha = {0.5, 0.1} given n = 30 samples,  completing
## 10 trials per parameterization (iter) for a normal(mean = 2, sd = 3) rv
coversim(alpha = c(0.5, 0.1), "norm", n = 30, iter = 10, mu = 2, sigma = 3)

## show plots for 5 iterations of 30 samples each from a Weibull(2, 3)
coversim(0.5, "weibull", n = 30, iter = 5, lambda = 1.5, kappa = 0.5, showplot = TRUE,
origin = TRUE)




