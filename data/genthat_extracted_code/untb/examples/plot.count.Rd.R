library(untb)


### Name: plot.count
### Title: Abundance curves
### Aliases: plot.count plot.census
### Keywords: math

### ** Examples

data(copepod)
plot(copepod)

data(butterflies)
plot(butterflies,uncertainty=TRUE)

x <- count(c(pigs=1, dogs=1, cats=2, frogs=3, bats=5, slugs=8))
plot(x,expectation=TRUE,ylim=c(0.5,10))




