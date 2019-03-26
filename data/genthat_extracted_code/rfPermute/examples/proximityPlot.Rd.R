library(rfPermute)


### Name: proximityPlot
### Title: Plot Random Forest Proximity Scores
### Aliases: proximityPlot

### ** Examples

data(symb.metab)

rf <- randomForest(type ~ ., symb.metab, proximity = TRUE)
proximityPlot(rf)




