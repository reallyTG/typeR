library(discharge)


### Name: circ.s
### Title: Estimate directional statistics for one-sigma events
### Aliases: circ.s

### ** Examples

# load data
data("sycamore")

# compare for periods from 1960 to 1979 and 1980 to 1999
comp = compare.periods(c("1960-01-01", "1979-12-31"), 
c("1980-01-01", "1999-12-31"), sycamore, plot=FALSE)

circ.s(comp)



