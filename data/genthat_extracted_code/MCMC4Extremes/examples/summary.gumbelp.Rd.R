library(MCMC4Extremes)


### Name: summary.gumbelp
### Title: Summarizing Posterior Distribution with Parameters of Gumbel
### Aliases: summary.gumbelp

### ** Examples

# Example with simulated datapoints
x=rgev(300,0.01,10,5)
fit=gumbelp(x,1,300)
fitgum=summary(fit)

# Compare if the fit measures of gumbel is better than measures using GEV
## Not run: fit2=gevp(x,1,300)
## Not run: fitgev=summary(fit2)
# the best model is that with lowest fit measures



