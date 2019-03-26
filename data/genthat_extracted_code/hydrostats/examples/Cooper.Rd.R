library(hydrostats)


### Name: Cooper
### Title: Cooper Creek flow data
### Aliases: Cooper

### ** Examples

data(Cooper)
Cooper<-ts.format(Cooper)
plot(Cooper[, "Date"],Cooper[, "Q"],type="l", xlab="Date",ylab="Discharge (ML/day)")





