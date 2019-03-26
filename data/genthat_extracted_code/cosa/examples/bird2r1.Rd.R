library(cosa)


### Name: bird2r1
### Title: Blocked Individual-level Regression Discontinuity (Two-level
###   Design, Discontinuity at Level 1)
### Aliases: bird2r1 cosa.bird2r1 mdes.bird2r1 power.bird2r1

### ** Examples

# cost constrained - optimize n1 and n2
cosa.bird2r1(constrain = "cost", cost = 5000,
             cn1 = c(5, 4), cn2 = 10,
             es = .20, rho2 = .20, omega2 = .20,
             r21 = .20, r2t2 = .20, g2 = 1,
             p = .50, n1 = NULL, n2 = NULL)

# minimum detectable effect size
mdes.bird2r1(power = .80, rho2 = .20, omega2 = .20,
             r21 = .20, r2t2 = .30, g2 = 1, p = .50,
             n1 = 26.96, n2 = 22)

# statistical power
power.bird2r1(es = .20, rho2 = .20, omega2 = .20,
              r21 = .20, r2t2 = .30, g2 = 1, p = .50,
              n1 = 26.96, n2 = 22)



