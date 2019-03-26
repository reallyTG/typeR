library(BART)


### Name: stratrs
### Title: Perform stratified random sampling to balance outcomes
### Aliases: stratrs
### Keywords: convergence diagnostics

### ** Examples

set.seed(12)
x <- rbinom(25000, 1, 0.1)
a <- stratrs(x)
table(a, x)
z <- pmin(rpois(25000, 0.8), 5)
b <- stratrs(z)
table(b, z)



