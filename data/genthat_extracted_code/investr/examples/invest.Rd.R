library(investr)


### Name: invest
### Title: Calibration for Linear and Nonlinear Regression Models.
### Aliases: invest invest.glm invest.lm invest.lme invest.nls

### ** Examples

#
# Dobson's beetle data (generalized linear model)
#

# Complementary log-log model
mod <- glm(cbind(y, n-y) ~ ldose, data = beetle, 
           family = binomial(link = "cloglog"))
plotFit(mod, pch = 19, cex = 1.2, lwd = 2, 
        xlab = "Log dose of carbon disulphide",
        interval = "confidence", shade = TRUE, 
        col.conf = "lightskyblue")

# Approximate 95% confidence intervals and standard error for LD50
invest(mod, y0 = 0.5)
invest(mod, y0 = 0.5, interval = "Wald")

#
# Nasturtium example (nonlinear least-squares with replication)
#

# Log-logistic model
mod <- nls(weight ~ theta1/(1 + exp(theta2 + theta3 * log(conc))),
           start = list(theta1 = 1000, theta2 = -1, theta3 = 1),
           data = nasturtium)
plotFit(mod, lwd.fit = 2)
           
# Compute approximate 95% calibration intervals
invest(mod, y0 = c(309, 296, 419), interval = "inversion")
invest(mod, y0 = c(309, 296, 419), interval = "Wald")  

# Bootstrap calibration intervals. In general, nsim should be as large as 
# reasonably possible (say, nsim = 9999).
boo <- invest(mod, y0 = c(309, 296, 419), interval = "percentile", 
              nsim = 999, seed = 101)
boo  # print bootstrap summary
plot(boo)  # plot results



