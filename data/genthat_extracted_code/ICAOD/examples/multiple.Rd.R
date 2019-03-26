library(ICAOD)


### Name: multiple
### Title: Locally Multiple Objective Optimal Designs for the 4-Parameter
###   Hill Model
### Aliases: multiple

### ** Examples

# All th examples here are available in Hyun and Wong (2015)

#################################
#  4-parameter logistic model
# Example 1, Table 3
#################################
lam <- c(0.05, 0.05, .90)
# Initial estimates are derived from Table 1
# See how the stopping rules are set via 'stop_rul', checkfreq' and 'stoptol'
Theta1 <- c(1.563, 1.790, 8.442, 0.137)
res1 <- multiple(minDose = log(.001), maxDose = log(1000),
                 inipars = Theta1, k = 4, lambda = lam, delta = -1,
                 iter = 1,
                 ICA.control = list(rseed = 1366, ncount = 100,
                                    stop_rule = "equivalence",
                                    checkfreq = 100, stoptol = .95))
## Not run: 
##D res1 <- iterate(res1, 1000)
##D # stops at iteration 101
## End(Not run)

#################################
#  4-parameter Hill model
#################################
## initial estimates for the parameters of Hill model:
a <- 0.008949  # ED50
b <- -1.79 # Hill constant
c <- 0.137 # lower limit
d <- 1.7 # upper limit
# D belongs to c(.001, 1000) ## dose in mg
## the vector of Hill parameters are now c(a, b, c, d)
## Not run: 
##D res2 <- multiple(minDose = .001, maxDose = 1000,
##D                  inipars =  c(a, b, c, d),
##D                  Hill_par = TRUE, k = 4, lambda = lam,
##D                  delta = -1, iter = 1000,
##D                  ICA.control = list(rseed = 1366, ncount = 100,
##D                                     stop_rule = "equivalence",
##D                                     checkfreq = 100, stoptol = .95))
##D # stops at iteration 100
## End(Not run)











