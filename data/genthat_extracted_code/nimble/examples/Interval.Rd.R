library(nimble)


### Name: Interval
### Title: Interval calculations
### Aliases: Interval dinterval rinterval

### ** Examples

endpoints <- c(-3, 0, 3)
vals <- c(-4, -1, 1, 5)
x <- rinterval(4, vals, endpoints)
dinterval(x, vals, endpoints)
dinterval(c(1, 5, 2, 3), vals, endpoints)



