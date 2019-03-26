library(hydrostats)


### Name: hydrostats
### Title: calculate hydrologic statistics
### Aliases: hydrostats hydrostats

### ** Examples

data(Acheron)
Acheron<-ts.format(Acheron)
with(Acheron, plot(Q~Date))

high.spell.lengths(Acheron, threshold=50000)





