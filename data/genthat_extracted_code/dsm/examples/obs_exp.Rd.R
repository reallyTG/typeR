library(dsm)


### Name: obs_exp
### Title: Observed versus expected diagnostics for fitted DSMs
### Aliases: obs_exp

### ** Examples

library(Distance)
library(dsm)

# example with the Gulf of Mexico dolphin data
data(mexdolphins)
hr.model <- ds(distdata, max(distdata$distance),
               key = "hr", adjustment = NULL)
mod1 <- dsm(count~s(x,y), hr.model, segdata, obsdata)



