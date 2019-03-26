library(cmna)


### Name: ivpsys
### Title: Initial value problems for systems of ordinary differential
###   equations
### Aliases: ivpsys eulersys

### ** Examples

f <- function(x, y) { y / (2 * x + 1) }
ivp.euler <- euler(f, 0, 1, 1/100, 100)



