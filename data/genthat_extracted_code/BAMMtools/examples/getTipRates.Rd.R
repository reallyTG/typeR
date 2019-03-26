library(BAMMtools)


### Name: getTipRates
### Title: Compute tip-specific macroevolutionary rates from 'bammdata'
###   object
### Aliases: getTipRates
### Keywords: models

### ** Examples

data(whales, events.whales)
ephy <- getEventData(whales, events.whales, burnin=0.25, nsamples = 500)

# return a vector of average species-specific speciation rates.
meanlam <- getTipRates(ephy, returnNetDiv = FALSE,
                       statistic = 'mean')$lambda.avg
meanlam

# return a vector of median species-specific net diversification rates.
ndr <- getTipRates(ephy, returnNetDiv = TRUE,
                   statistic = 'median')$netdiv.avg

# Return mean species-specific speciation rates from all posterior 
# samples in the \code{bamm-data} object.
lam <- getTipRates(ephy, returnNetDiv = FALSE, statistic = 'mean')$lambda
rowMeans(lam)



