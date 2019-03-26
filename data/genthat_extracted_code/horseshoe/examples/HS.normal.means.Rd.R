library(horseshoe)


### Name: HS.normal.means
### Title: The horseshoe prior for the sparse normal means problem
### Aliases: HS.normal.means

### ** Examples

#Empirical Bayes example with 20 signals, rest is noise
#Posterior mean for the signals is plotted
#And variable selection is performed using the credible intervals
#And the credible intervals are plotted
truth <- c(rep(0, 80), rep(8, 20))
data <-  truth + rnorm(100, 1)
tau.hat <- HS.MMLE(data, Sigma2 = 1)
res.HS1 <- HS.normal.means(data, method.tau = "fixed", tau = tau.hat,
method.sigma = "fixed", Sigma2 = 1)
#Plot the posterior mean against the data (signals in blue)
plot(data, res.HS1$BetaHat, col = c(rep("black", 80), rep("blue", 20)))
#Find the selected betas (ideally, the last 20 are equal to 1)
HS.var.select(res.HS1, data, method = "intervals")
#Plot the credible intervals
library(Hmisc)
xYplot(Cbind(res.HS1$BetaHat, res.HS1$LeftCI, res.HS1$RightCI) ~ 1:100)


#Full Bayes example with 20 signals, rest is noise
#Posterior mean for the signals is plotted
#And variable selection is performed using the credible intervals
#And the credible intervals are plotted
truth <- c(rep(0, 80), rep(8, 20))
data <-  truth + rnorm(100, 3)
res.HS2 <- HS.normal.means(data, method.tau = "truncatedCauchy", method.sigma = "Jeffreys")
#Plot the posterior mean against the data (signals in blue)
plot(data, res.HS2$BetaHat, col = c(rep("black", 80), rep("blue", 20)))
#Find the selected betas (ideally, the last 20 are equal to 1)
HS.var.select(res.HS2, data, method = "intervals")
#Plot the credible intervals
library(Hmisc)
xYplot(Cbind(res.HS2$BetaHat, res.HS2$LeftCI, res.HS2$RightCI) ~ 1:100)



