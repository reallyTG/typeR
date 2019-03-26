library(diagis)


### Name: weight_plot
### Title: Diagnostic plot of importance sampling weights
### Aliases: weight_plot

### ** Examples

#' importance sampling from too narrow distribution
#' weights have infinite variance
set.seed(1)
x_inf <- rnorm(1000, sd = 0.1)
w_inf <- dnorm(x_inf) / dnorm(x_inf, 0, 0.1)
weight_plot(w_inf)
x_opt <- rnorm(1000, sd = sqrt(2))
w_opt <- dnorm(x_opt) / dnorm(x_opt, 0, sqrt(2))
weight_plot(w_opt)



