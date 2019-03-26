library(PoweR)


### Name: statcompute
### Title: Performs a hypothesis test for the given value of statistic.
### Aliases: statcompute
### Keywords: htest

### ** Examples

data <- rnorm(50)
# Shapiro-Wilk test:
statcompute(21, data, levels = c(0.05, 0.1), critvalL = NULL, critvalR = NULL,
            alter = 0, stat.pars = NULL)
# Identical to:
shapiro.test(data)

# The function statcompute() should not be used in simulations since it
#  is NOT fast. Consider instead the call below (but see the Details
#  Section):
.C("stat21", data = data, n = 50L, levels = 0.05, nblevels = 1L, name =
rep(" ", 50), getname = 0L, statistic = 0, pvalcomp = 1L, pvalue = 0, cL = 0.0,
cR = 0.0, usecrit = 0L, alter = 4L, decision = 0L, stat.pars = 0.0, 
nbparstat = 0L)




