library(FuzzyLP)


### Name: FCLP.classicObjective
### Title: Solves a Fuzzy Linear Programming problem with fuzzy constraints
###   trying to assure a minimum (maximum) value of the objective function.
### Aliases: FCLP.classicObjective FCLP.fuzzyObjective
###   FCLP.fuzzyUndefinedObjective FCLP.fuzzyUndefinedNormObjective

### ** Examples

## maximize:   3*x1 + x2 >= z0
## s.t.:       1.875*x1   - 1.5*x2 <= 4 + (1-beta)*5
##              4.75*x1 + 2.125*x2 <= 14.5 + (1-beta)*6
##               x1, x2 are non-negative real numbers

obj <- c(3, 1)
A <- matrix(c(1.875, 4.75, -1.5, 2.125), nrow = 2)
dir <- c("<=", "<=")
b <- c(4, 14.5)
t <- c(5, 6)
max <- TRUE

# Problem with solution
FCLP.classicObjective(obj, A, dir, b, t, z0=11, maximum=max, verbose = TRUE)

# This problem has a bound impossible to reach
FCLP.classicObjective(obj, A, dir, b, t, z0=14, maximum=max, verbose = TRUE)


# This problem has a fuzzy bound impossible to reach
FCLP.fuzzyObjective(obj, A, dir, b, t, z0=14, t0=1, maximum=max, verbose = TRUE)

# This problem has a fuzzy bound reachable
FCLP.fuzzyObjective(obj, A, dir, b, t, z0=14, t0=2, maximum=max, verbose = TRUE)


# We want the function estimates a bound and a tolerance
FCLP.fuzzyUndefinedObjective(obj, A, dir, b, t, maximum=max, verbose = TRUE)


# We want the function estimates a bound and a tolerance
FCLP.fuzzyUndefinedNormObjective(obj, A, dir, b, t, maximum=max, verbose = TRUE)




