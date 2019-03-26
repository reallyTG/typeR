library(STAR)


### Name: varianceTime
### Title: Variance-Time Analysis for Spike Trains
### Aliases: varianceTime plot.varianceTime is.varianceTime
### Keywords: ts survival

### ** Examples

## Replicate (almost) Fig. 5 of Ogata 1988
data(ShallowShocks)
vtShallow <- varianceTime(ShallowShocks$Date,,c(5,10,20,40,60,80,seq(100,500,by = 25))*10)
is.varianceTime(vtShallow)
plot(vtShallow, style="Ogata")



