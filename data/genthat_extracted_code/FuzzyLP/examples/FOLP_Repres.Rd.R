library(FuzzyLP)


### Name: FOLP.multiObj
### Title: Solves a fuzzy objective linear programming problem using
###   Representation Theorem.
### Aliases: FOLP.multiObj FOLP.interv FOLP.strat

### ** Examples

## maximize:   [0,2,3]*x1 + [1,3,4,5]*x2
## s.t.:         x1 + 3*x2 <= 6
##               x1 +   x2 <= 4
##               x1, x2 are non-negative real numbers

obj <- c(FuzzyNumbers::TrapezoidalFuzzyNumber(0,2,2,3), 
         FuzzyNumbers::TrapezoidalFuzzyNumber(1,3,4,5))
A<-matrix(c(1, 1, 3, 1), nrow = 2)
dir <- c("<=", "<=")
b <- c(6, 4)
max <- TRUE

# Using a Multiobjective approach.
FOLP.multiObj(obj, A, dir, b, maximum = max, min=0, max=1, step=0.2)


# Using a Intervalar approach.
FOLP.interv(obj, A, dir, b, maximum = max, w1=0.3, min=0, max=1, step=0.2)


# Using a Stratified approach.
FOLP.strat(obj, A, dir, b, maximum = max, min=0, max=1, step=0.2)




