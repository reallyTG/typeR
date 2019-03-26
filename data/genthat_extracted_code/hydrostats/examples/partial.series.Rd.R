library(hydrostats)


### Name: partial.series
### Title: Partial and annual exceedence series.
### Aliases: partial.series

### ** Examples

data(Cooper)
Cooper<-ts.format(Cooper)

partial.series(Cooper,ari=2)
partial.series(Cooper, ari=5, plot=TRUE, ind.days=2)
partial.series(Cooper, ari=5, plot=TRUE, ind.days=10)



