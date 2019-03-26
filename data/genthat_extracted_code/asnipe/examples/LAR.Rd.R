library(asnipe)


### Name: LAR
### Title: Mean Lagged Association Rate
### Aliases: LAR

### ** Examples


data("group_by_individual")
data("times")
data("individuals")

## calculate lagged association rate for great tits
lagged_rates <- LAR(gbi,times,3600, classes=inds$SPECIES, which_classes="GRETI")

## plot the results
plot(lagged_rates, type='l', axes=FALSE, xlab="Time (hours)", ylab="LAR", ylim=c(0,1))
axis(2)
axis(1, at=lagged_rates[,1], labels=c(1:nrow(lagged_rates)))




