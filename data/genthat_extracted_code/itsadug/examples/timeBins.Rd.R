library(itsadug)


### Name: timeBins
### Title: Label timestamps as timebins of a given binsize.
### Aliases: timeBins

### ** Examples

data(simdat)
# grouping Time values in bins:
simdat$Timebin <- timeBins(simdat$Time, 200)
head(simdat)

# different labels:
simdat$Timebin2 <- timeBins(simdat$Time, 200, pos=0)
head(simdat)



