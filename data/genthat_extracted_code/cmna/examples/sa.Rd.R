library(cmna)


### Name: sa
### Title: Simulated annealing
### Aliases: sa tspsa

### ** Examples

f <- function(x) { x^6 - 4 * x^5 - 7 * x^4 + 22 * x^3 + 24 * x^2 + 2}
sa(f, 0)

f <- function(x) { (x[1] - 1)^2 + (x[2] - 1)^2 }
sa(f, c(0, 0), 0.05)




