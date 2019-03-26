library(GenSA)


### Name: GenSA
### Title: Generalized Simulated Annealing Function
### Aliases: GenSA
### Keywords: package, Generalized Simulated Annealing, optimization

### ** Examples

    library(GenSA)
# Try Rastrgin function (The objective function value for global minimum
# is 0 with all components of par are 0.)
        Rastrigin <- function(x) {
            sum(x^2 - 10 * cos(2 * pi  * x)) + 10 * length(x)
        }
# Perform the search on a 30 dimensions rastrigin function. Rastrigin
# function with dimension 30 is known as the most
# difficult optimization problem according to "Yao X, Liu Y, Lin G (1999).
# \Evolutionary Programming Made Faster."
# IEEE Transactions on Evolutionary Computation, 3(2), 82-102.

# GenSA will stop after finding the targeted function value 0 with
# absolute tolerance 1e-13
    set.seed(1234) # The user can use any seed.
        dimension <- 30
        global.min <- 0
        tol <- 1e-13
        lower <- rep(-5.12, dimension)
        upper <- rep(5.12, dimension)
        out <- GenSA(lower = lower, upper = upper, fn = Rastrigin,
                control=list(threshold.stop=global.min+tol,verbose=TRUE))
        out[c("value","par","counts")]

# GenSA will stop after running for about 2 seconds
# Note: The time for solving this problem by GenSA may vary
# depending on the computer used. 
        set.seed(1234) # The user can use any seed.
        dimension <- 30
        global.min <- 0
        tol <- 1e-13
        lower <- rep(-5.12, dimension)
        upper <- rep(5.12, dimension)
        out <- GenSA(lower = lower, upper = upper, fn = Rastrigin,
                control=list(max.time=2))
        out[c("value","par","counts")]



