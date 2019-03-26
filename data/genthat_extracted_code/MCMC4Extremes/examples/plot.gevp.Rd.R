library(MCMC4Extremes)


### Name: plot.gevp
### Title: Plot Fitted GEV Model
### Aliases: plot.gevp

### ** Examples

# Return level of river nidd data
data(nidd.annual)
out=gevp(nidd.annual,1,300)
## Not run: plot(out,"histogram")
plot(out,"predictive")
## Not run: plot(out,"retlevel", 10, 50)



