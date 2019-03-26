library(BAMMtools)


### Name: getCladeRates
### Title: Compute clade-specific mean rates
### Aliases: getCladeRates
### Keywords: models

### ** Examples

data(events.whales, whales)
ed <- getEventData(whales, events.whales, nsamples=500)
all_rates <- getCladeRates(ed)

mean(all_rates$lambda)
mean(all_rates$mu)
# joint density of mean speciation and extinction rates:
plot(all_rates$mu ~ all_rates$lambda)

# clade specific rates: here for Dolphin subtree:
dol_rates <- getCladeRates(ed, node=140)
mean(dol_rates$lambda)
mean(dol_rates$mu)

# defining multiple nodes
mean(getCladeRates(ed, node=c(132, 140),
     nodetype=c('include','exclude'))$lambda)



