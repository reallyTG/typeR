library(lavaan)


### Name: lavTestScore
### Title: Score test
### Aliases: lavTestScore lavtestscore score Score lavScoreTest

### ** Examples

HS.model <- '
    visual  =~ x1 + b1*x2 + x3
    textual =~ x4 + b2*x5 + x6
    speed   =~ x7 + b3*x8 + x9

    b1 == b2
    b2 == b3
'
fit <- cfa(HS.model, data=HolzingerSwineford1939)

# test 1: release both two equality constraints
lavTestScore(fit, cumulative = TRUE)

# test 2: the score test for adding two (currently fixed
# to zero) cross-loadings
newpar = '
    visual =~ x9
    textual =~ x3
'
lavTestScore(fit, add = newpar)

# equivalently, "add" can be a parameter table specifying parameters to free,
# but must include some additional information:
PT.add <- data.frame(lhs = c("visual","textual"),
                     op = c("=~","=~"),
                     rhs = c("x9","x3"),
                     user = 10L, # needed to identify new parameters
                     free = 1, # arbitrary numbers > 0
                     start = 0) # null-hypothesized value
PT.add
lavTestScore(fit, add = PT.add) # same result as above




