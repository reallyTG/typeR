library(MCMC4Extremes)


### Name: plot.gumbelp
### Title: Plot Fitted Gumbel Model
### Aliases: plot.gumbelp

### ** Examples

data(nidd.annual)
out=gumbelp(nidd.annual,1,500)
## Not run: plot(out,"histogram")
## Not run: plot(out,"predictive")
plot(out,"retlevel", 10)



