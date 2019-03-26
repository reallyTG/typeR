library(cmna)


### Name: ivp
### Title: Initial value problems
### Aliases: ivp euler midptivp rungekutta4 adamsbashforth

### ** Examples

f <- function(x, y) { y / (2 * x + 1) }
ivp.euler <- euler(f, 0, 1, 1/100, 100)
ivp.midpt <- midptivp(f, 0, 1, 1/100, 100)
ivp.rk4 <- rungekutta4(f, 0, 1, 1/100, 100)



