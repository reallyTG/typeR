library(lavaan)


### Name: lavTestWald
### Title: Wald test
### Aliases: lavTestWald lavtestwald wald Wald lavWaldTest

### ** Examples

HS.model <- '
    visual  =~ x1 + b1*x2 + x3
    textual =~ x4 + b2*x5 + x6
    speed   =~ x7 + b3*x8 + x9
'

fit <- cfa(HS.model, data=HolzingerSwineford1939)

# test 1: test about a single parameter
# this is the 'chi-square' version of the 
# z-test from the summary() output
lavTestWald(fit, constraints = "b1 == 0")

# test 2: several constraints
con = '
   2*b1 == b3
   b2 - b3 == 0
'
lavTestWald(fit, constraints = con)



