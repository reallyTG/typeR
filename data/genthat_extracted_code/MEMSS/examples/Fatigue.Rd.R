library(MEMSS)


### Name: Fatigue
### Title: Cracks caused by metal fatigue
### Aliases: Fatigue
### Keywords: datasets

### ** Examples

require(lattice)
str(Fatigue)
xyplot(relLength ~ cycles | Path, Fatigue, type = c("g", "b"),
       aspect = 'xy', xlab = "Number of test cycles (millions)",
       ylab = "Relative crack length (dimensionless)",
       layout = c(7,3))



