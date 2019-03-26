library(cmna)


### Name: mcint
### Title: Monte Carlo Integration
### Aliases: mcint mcint2

### ** Examples

f <- function(x) { sin(x)^2 + log(x)}
mcint(f, 0, 1)
mcint(f, 0, 1, m = 10e6)




