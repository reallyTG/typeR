library(CopulaCenR)


### Name: data_sim_copula
### Title: Simulate bivariate time-to-event times based on specific copula
###   and marginal distributions
### Aliases: data_sim_copula

### ** Examples

library(CopulaCenR)
set.seed(1)
dat <- data_sim_copula(n = 500, copula = "Clayton", eta = 3,
                       dist = "Weibull", baseline = c(0.1,2),
                       var_list = c("var1", "var2"),
                       COV_beta = c(0.1, 0.1),
                       x1 = cbind(rnorm(500, 6, 2),
                                  rbinom(500, 1, 0.5)),
                       x2 =  cbind(rnorm(500, 6, 2),
                                   rbinom(500, 1, 0.5)))
plot(x = dat$time[dat$ind == 1], y = dat$time[dat$ind == 2],
     xlab = expression(t[1]), ylab = expression(t[2]),
     cex.axis = 1, cex.lab = 1.3)



