library(diagis)


### Name: diagis
### Title: Auxiliary functions and diagnostic plots for importance sampling
### Aliases: diagis diagis-package

### ** Examples

# simple importance sampling example
# true distribution is a standard normal:
p <- function(x) dnorm(x)
# proposal distribution is normal with sd s
q <- function(x, s) dnorm(x, 0, s)

# IS weights have finite variance only if s^2 > 1/2
# variance is s/(2-1/s^2)^(3/2)

#optimal case
set.seed(42)
s_opt <- sqrt(2)
x_opt <- rnorm(1000, sd = s_opt)
w_opt <- p(x_opt) / q(x_opt, s_opt) 
weighted_mean(x_opt, w_opt)
weighted_var(x_opt, w_opt)
s_inf <- 0.25
x_inf <- rnorm(1000, sd = s_inf)
w_inf <- p(x_inf) / q(x_inf, s_inf)
weighted_mean(x_inf, w_inf) #!!
weighted_var(x_inf, w_inf) #!!
# diagnostic plots
weight_plot(w_inf)
weight_plot(w_opt)



