library(FuzzyLP)


### Name: FCLP.fixedBeta
### Title: Solves a Fuzzy Linear Programming problem with fuzzy
###   constraints.
### Aliases: FCLP.fixedBeta FCLP.sampledBeta

### ** Examples

## maximize:   3*x1 + x2
## s.t.:       1.875*x1   - 1.5*x2 <= 4 + (1-beta)*5
##              4.75*x1 + 2.125*x2 <= 14.5 + (1-beta)*6
##               x1, x2 are non-negative real numbers

obj <- c(3, 1)
A <- matrix(c(1.875, 4.75, -1.5, 2.125), nrow = 2)
dir <- c("<=", "<=")
b <- c(4, 14.5)
t <- c(5, 6)
valbeta <- 0.5
max <- TRUE

FCLP.fixedBeta(obj, A, dir, b, t, beta=valbeta, maximum = max, verbose = TRUE)

FCLP.sampledBeta(obj, A, dir, b, t, min=0, max=1, step=0.25, maximum = max, verbose = TRUE)



