library(lestat)


### Name: lestat-package
### Title: LEarning STATistics using Bayesian object oriented computation
### Aliases: lestat-package lestat

### ** Examples

prior <- normalexpgamma() #Generate a two-parameter flat prior
full <- linearpredict(prior, rep(1, 7)) #Extend with normal distribution
data <- runif(7) #Generate data
posterior <- conditional(full, 1:7, data) #Condition on parameters
credibilityinterval(marginal(posterior, 1)) #Investigate posterior



