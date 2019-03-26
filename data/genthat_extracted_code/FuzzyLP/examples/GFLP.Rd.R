library(FuzzyLP)


### Name: GFLP
### Title: Solves a maximization (minimization) problem having fuzzy
###   coefficients in the constraints, the objective function and/or the
###   technological matrix.
### Aliases: GFLP

### ** Examples

## maximize:   [1,3,4,5]*x1 + x2
## s.t.:         [0,2,3,3.5]*x1 +   [0,1,1,4]*x2 <= [2,2,2,3] + (1-beta)*[1,2,2,3]
##               [3,5,5,6]*x1   + [1.5,2,2,3]*x2 <= 12
##               x1, x2 are non-negative real numbers

obj <- c(FuzzyNumbers::TrapezoidalFuzzyNumber(1,3,4,5), 1)

a11 <- FuzzyNumbers::TrapezoidalFuzzyNumber(0,2,2,3.5)
a21 <- FuzzyNumbers::TrapezoidalFuzzyNumber(3,5,5,6)
a12 <- -FuzzyNumbers::TrapezoidalFuzzyNumber(0,1,1,4)
a22 <- FuzzyNumbers::TrapezoidalFuzzyNumber(1.5,2,2,3)
A <- matrix(c(a11, a21, a12, a22), nrow = 2)

dir <- c("<=", "<=")
b<-c(FuzzyNumbers::TrapezoidalFuzzyNumber(2,2,2,3), 12)
t<-c(FuzzyNumbers::TrapezoidalFuzzyNumber(1,2,2,3),0);
max <- TRUE

GFLP(obj, A, dir, b, t, maximum = max, ordf_obj="Yager1", ordf_res="Yager3")
GFLP(obj, A, dir, b, t, maximum = max, ordf_obj="Adamo", ordf_obj_param=0.5, ordf_res="Yager3")
GFLP(obj, A, dir, b, t, maximum = max, "Average", ordf_obj_param=c(t=3, lambda=0.5), 
ordf_res="Adamo", ordf_res_param = 0.5)
GFLP(obj, A, dir, b, t, maximum = max, ordf_obj="Average", ordf_obj_param=c(t=3, lambda=0.8), 
ordf_res="Yager3", min = 0, max = 1, step = 0.2)



