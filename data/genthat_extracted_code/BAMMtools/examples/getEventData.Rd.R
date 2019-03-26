library(BAMMtools)


### Name: getEventData
### Title: Create 'bammdata' object from MCMC output
### Aliases: getEventData
### Keywords: models

### ** Examples

data(primates, events.primates)
xx <- getEventData(primates, events.primates, burnin=0.25, nsamples=500,
                   type = 'trait')

# compute mean phenotypic rate for primate body size evolution:
brates <- getCladeRates(xx)
mean(brates$beta)

# Plot rates:
plot(xx)



