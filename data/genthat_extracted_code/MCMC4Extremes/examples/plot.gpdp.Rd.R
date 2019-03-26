library(MCMC4Extremes)


### Name: plot.gpdp
### Title: Plot Fitted GPD Model
### Aliases: plot.gpdp

### ** Examples

data(danish)
out=gpdp(danish,10,300)
## Not run: plot(out,"histogram")
## Not run: plot(out,"predictive")
plot(out,"retlevel", 10, 50)



