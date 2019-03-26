library(TreeBUGS)


### Name: probitInverse
### Title: Probit-Inverse of Group-Level Normal Distribution
### Aliases: probitInverse

### ** Examples

####### compare bivariate vs. univariate transformation
probitInverse(mu=.8, sigma=c(.25,.5,.75,1))
pnorm(.8)

# full distribution
prob <- pnorm(rnorm(10000, .8, .7))
hist(prob, 80, col="gray", xlim=0:1)

## Not run: 
##D # transformation for fitted model
##D mean_sd <- probitInverse(fittedModel=fit)
##D summarizeMCMC(mean_sd)
## End(Not run)



