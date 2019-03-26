library(BIOdry)


### Name: mUnits
### Title: Metric system
### Aliases: mUnits

### ** Examples

## Simulation of TRW data
set.seed(1)
w <- abs(rnorm(12,1,1))
trw <- ts(w,start = 1970)
## transforming metric units of trw vector from milimeters to meters
sr <- mUnits(trw, from = 'mm', to = 'm')
attributes(sr)



