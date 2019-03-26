library(PowerTOST)


### Name: exppower.noninf
### Title: Expected power of the non-inferiority test
### Aliases: exppower.noninf

### ** Examples

# Expected power for non-inferiority test for a 2x2 crossover
# with 40 subjects. CV 30% known from a pilot 2x2 study with 
# 12 subjects 
# using all the defaults for other parameters (theta0 carved in stone)
# should give: [1] 0.6761068
exppower.noninf(CV = 0.3, n = 40, prior.parm = list(df = 12-2))
# or equivalently
exppower.noninf(CV = 0.3, n = 40, prior.parm = list(m = 12, design = "2x2"))

# May be also calculated via exppower.TOST() after setting upper acceptance limit 
# to Inf and alpha=0.025
exppower.TOST(CV = 0.3, n = 40, prior.parm = list(df = 10), theta2 = Inf, alpha=0.025)

# In contrast: Julious approximation
exppower.noninf(CV = 0.3, n = 40, prior.parm = list(df = 10), method = "approx")
# should give: [1] 0.6751358

# Compare this to the usual (conditional) power (CV known, "carved in stone")
power.noninf(CV = 0.3, n = 40)
# should give: [1] 0.7228685
# same as if setting df = Inf in function exppower.noninf()
exppower.noninf(CV = 0.3, n = 40, prior.parm = list(df = Inf))

# Expected power for a 2x2 crossover with 40 subjects
# CV 30% and theta0 = 0.95 known from a pilot 2x2 study with 12 subjects
# using uncertainty with respect to both CV and theta0
exppower.noninf(CV = 0.3, theta0 = 0.95, n = 40, 
                prior.parm = list(m = 12, design = "2x2"), prior.type = "both")
# should give a decrease of expected power to 0.5982852



