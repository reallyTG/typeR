library(seismic)


### Name: get.infectiousness
### Title: Estimate the infectiousness of an information cascade
### Aliases: get.infectiousness

### ** Examples

data(tweet)
pred.time <- seq(0, 6 * 60 * 60, by = 60)
infectiousness <- get.infectiousness(tweet[, 1], tweet[, 2], pred.time)
plot(pred.time, infectiousness$infectiousness)



