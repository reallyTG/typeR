library(scoring)


### Name: WorldEvents
### Title: Forecasts of world events
### Aliases: WorldEvents
### Keywords: datasets

### ** Examples

data("WorldEvents")

## Average forecast for each item
with(WorldEvents, tapply(forecast, item, mean))

## Brier scores
bs <- calcscore(answer ~ forecast, data = WorldEvents, bounds=c(0,1))



