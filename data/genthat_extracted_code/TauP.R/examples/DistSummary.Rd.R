library(TauP.R)


### Name: DistSummary
### Title: Arrival Summary
### Aliases: DistSummary
### Keywords: misc

### ** Examples

data(model)

# for an event occurring 100 degrees away at a depth of 40 km:

DistSummary(delta = 100, h = 40, model = model, phaselist = c('SKS', 'SKKS'))



