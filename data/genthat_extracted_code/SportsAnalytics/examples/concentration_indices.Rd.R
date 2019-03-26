library(SportsAnalytics)


### Name: herfindahl
### Title: Concentration indices
### Aliases: concentration_indices exogeny herfindahl rosenbluth

### ** Examples

## See demo("concentration-bundesliga") for a real-world
## application.

set.seed(1234)
x <- sample(100000, 10)

## Classical concentration indices:
herfindahl(x)
rosenbluth(x)

## Exogenous order is available:
o <- sample(10)
exogeny(x, o)



