library(surveillance)


### Name: sts_observation
### Title: Function for creating a sts-object with a given observation date
### Aliases: sts_observation

### ** Examples

data("salmAllOnset")
salmAllOnsety2013m01d20 <- sts_observation(salmAllOnset,
dateObservation="2014-01-20",cut=FALSE)
plot(salmAllOnset)
lines(salmAllOnsety2013m01d20@observed,t="h",col="red")



