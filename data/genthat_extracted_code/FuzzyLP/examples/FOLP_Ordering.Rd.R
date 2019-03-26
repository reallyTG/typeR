library(FuzzyLP)


### Name: FOLP.ordFun
### Title: Solves a fuzzy objective linear programming problem using
###   ordering functions.
### Aliases: FOLP.ordFun

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

FOLP.ordFun(obj, A, dir, b, maximum = max, ordf="Yager1")
FOLP.ordFun(obj, A, dir, b, maximum = max, ordf="Yager3")
FOLP.ordFun(obj, A, dir, b, maximum = max, ordf="Adamo", 0.5)
FOLP.ordFun(obj, A, dir, b, maximum = max, ordf="Average", lambda=0.8, t=3)

# Define a custom linear function
av <- function(tfn) {mean(FuzzyNumbers::core(tfn))}
FOLP.ordFun(obj, A, dir, b, maximum = max, ordf="Custom", FUN=av)

# Define a custom linear function
avp <- function(tfn, a) {a*mean(FuzzyNumbers::core(tfn))}
FOLP.ordFun(obj, A, dir, b, maximum = max, ordf="Custom", FUN=avp, a=2)



