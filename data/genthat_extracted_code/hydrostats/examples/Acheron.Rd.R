library(hydrostats)


### Name: Acheron
### Title: Acheron River flow data
### Aliases: Acheron

### ** Examples

data(Acheron)
Acheron<-ts.format(Acheron)
plot(Acheron[,"Date"],Acheron[,"Q"],type="l", xlab="Date",ylab="Discharge (ML/day)")





