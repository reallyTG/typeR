library(EpiEstim)


### Name: OverallInfectivity
### Title: Overall Infectivity Due To Previously Infected Individuals
### Aliases: OverallInfectivity

### ** Examples

## load data on pandemic flu in a school in 2009
data("Flu2009")

## compute overall infectivity
lambda <- OverallInfectivity(Flu2009$Incidence, Flu2009$SI.Distr)
par(mfrow=c(2,1))
plot(Flu2009$Incidence, type="s", xlab="time (days)", ylab="Incidence")
title(main="Epidemic curve")
plot(lambda, type="s", xlab="time (days)", ylab="Infectivity")
title(main="Overall infectivity")



