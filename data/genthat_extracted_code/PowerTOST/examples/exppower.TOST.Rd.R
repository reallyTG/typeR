library(PowerTOST)


### Name: exppower.TOST
### Title: Expected power of the TOST procedure
### Aliases: exppower.TOST

### ** Examples

# Expected power for a 2x2 crossover with 40 subjects
# CV 30% known from a pilot 2x2 study with 12 subjects
# using all the defaults for other parameters (theta0 carved in stone)
exppower.TOST(CV = 0.3, n = 40, prior.parm = list(df = 12-2))
# should give: [1] 0.7365519
# or equivalently
exppower.TOST(CV = 0.3, n = 40, prior.parm = list(m = 12, design = "2x2"))

# In contrast: Julious approximation
exppower.TOST(CV = 0.3, n = 40, prior.parm = list(df = 10), method = "approx")
# should give: [1] 0.7359771

# Compare this to the usual (conditional) power (CV known, "carved in stone")
power.TOST(CV = 0.3, n = 40)
# should give: [1] 0.8158453
# same as if setting df = Inf in function exppower.TOST()
exppower.TOST(CV = 0.3, n = 40, prior.parm = list(df = Inf))

# Expected power for a 2x2 crossover with 40 subjects
# CV 30% and theta0 = 0.95 known from a pilot 2x2 study with 12 subjects
# using uncertainty with respect to both CV and theta0
exppower.TOST(CV = 0.3, theta0 = 0.95, n = 40, 
              prior.parm = list(m = 12, design = "2x2"), prior.type = "both")
# should give [1] 0.5114685



