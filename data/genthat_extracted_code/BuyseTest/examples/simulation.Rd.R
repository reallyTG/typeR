library(BuyseTest)


### Name: Simulation function
### Title: Simulation of data for the BuyseTest
### Aliases: 'Simulation function' simBuyseTest
### Keywords: function simulations

### ** Examples

n <- 1e2

#### default option ####
simBuyseTest(n)

## with a strata variable having 5 levels
simBuyseTest(n, n.strata = 5)
## with a strata variable named grade
simBuyseTest(n, n.strata = 5, names.strata = "grade")
## several strata variables
simBuyseTest(1e3, n.strata = c(2,4), names.strata = c("Gender","AgeCategory"))

#### only binary endpoints ####
args <- list(p.T = c(3:5/10))
simBuyseTest(n, argsBin = args, argsCont = NULL, argsTTE = NULL)

#### only continuous endpoints ####
args <- list(mu.T = c(3:5/10), sigma.T = rep(1,3))
simBuyseTest(n, argsBin = NULL, argsCont = args, argsTTE = NULL)

#### only TTE endpoints ####
args <- list(rates.T = c(3:5/10), rates.Censoring = rep(1,3))
simBuyseTest(n, argsBin = NULL, argsCont = NULL, argsTTE = args)
        




