library(ICAOD)


### Name: locally
### Title: Locally D-Optimal Designs
### Aliases: locally

### ** Examples

#################################
# Exponential growth model
################################
# See how we set stopping rule by adjusting 'stop_rule', 'checkfreq' and 'stoptol'
# It calls the 'senslocally' function every checkfreq = 50 iterations to
# calculate the ELB. if ELB is greater than stoptol = .95, then the algoithm stops.

# initializing by one iteration
res1 <- locally(formula = ~a + exp(-b*x), predvars = "x", parvars = c("a", "b"),
                lx = 0, ux = 1, inipars = c(1, 10),
                iter = 1, k = 2,
                ICA.control= ICA.control(rseed = 100,
                                         stop_rule = "equivalence",
                                         checkfreq = 20, stoptol = .95))
## Not run: 
##D   # update the algorithm
##D   res1 <- iterate(res1, 150)
##D   #stops at iteration 21 because ELB is greater than .95
## End(Not run)

### fixed x, lx and ux are only required for equivalence theorem
## Not run: 
##D res1.1 <- locally(formula = ~a + exp(-b*x), predvars = "x", parvars = c("a", "b"),
##D                   lx = 0, ux = 1, inipars = c(1, 10),
##D                   iter = 100, k = 3,
##D                   x = c(.25, .5, .75),
##D                   ICA.control= ICA.control(rseed = 100))
##D plot(res1.1)
##D # we can not have an optimal design using this x
## End(Not run)

################################
## two parameter logistic model
################################
res2 <- locally(formula = ~1/(1 + exp(-b *(x - a))),
                predvars = "x", parvars = c("a", "b"),
                family = binomial(), lx = -3, ux = 3,
                inipars = c(1, 3), iter = 1, k = 2,
                ICA.control= list(rseed = 100, stop_rule = "equivalence",
                                  checkfreq = 50, stoptol = .95))
## Not run: 
##D   res2 <- iterate(res2, 100)
##D   # stops at iteration 51
## End(Not run)




################################
# A model with two predictors
################################
# mixed inhibition model
## Not run: 
##D   res3 <- locally(formula =  ~ V*S/(Km * (1 + I/Kic)+ S * (1 + I/Kiu)),
##D                   predvars = c("S", "I"),
##D                   parvars = c("V", "Km", "Kic", "Kiu"),
##D                   family = gaussian(),
##D                   lx = c(0, 0), ux = c(30, 60),
##D                   k = 4,
##D                   iter = 300,
##D                   inipars = c(1.5, 5.2, 3.4, 5.6),
##D                   ICA.control= list(rseed = 100, stop_rule = "equivalence",
##D                                     checkfreq = 50, stoptol = .95))
##D   # stops at iteration 100
## End(Not run)


## Not run: 
##D   # fixed x
##D   res3.1 <- locally(formula =  ~ V*S/(Km * (1 + I/Kic)+ S * (1 + I/Kiu)),
##D                   predvars = c("S", "I"),
##D                   parvars = c("V", "Km", "Kic", "Kiu"),
##D                   family = gaussian(),
##D                   lx = c(0, 0), ux = c(30, 60),
##D                   k = 5,
##D                   iter = 100,
##D                   x = c(20, 4, 20, 4, 10,  0, 0, 30, 3, 2),
##D                   inipars = c(1.5, 5.2, 3.4, 5.6),
##D                   ICA.control= list(rseed = 100))
## End(Not run)



