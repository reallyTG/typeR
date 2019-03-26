library(seismic)


### Name: pred.cascade
### Title: Predict the popularity of information cascade
### Aliases: pred.cascade

### ** Examples

data(tweet)
pred.time <- seq(0, 6 * 60 * 60, by = 60)
infectiousness <- get.infectiousness(tweet[, 1], tweet[, 2], pred.time)
pred <- pred.cascade(pred.time, infectiousness$infectiousness, tweet[, 1], tweet[, 2], n.star = 100)
plot(pred.time, pred)



