library(cosa)


### Name: ird1r1
### Title: Simple Individual-level Regression Discontinuity (w/ or w/o
###   Strata or Fixed Blocks)
### Aliases: ird1r1 bird2f1 cosa.bird2f1 mdes.ird1r1 mdes.bird2f1
###   power.ird1r1 power.bird2f1

### ** Examples


# minimum detectable effect size
mdes.ird1r1(power = .80, r2 = .20, g = 1, p = .50, n = 500)

# statistical power
power.ird1r1(es = .373, r2 = .20, g = 1, p = .50, n = 500)



