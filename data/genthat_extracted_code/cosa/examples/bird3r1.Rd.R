library(cosa)


### Name: bird3r1
### Title: Blocked Individual-level Regression Discontinuity (Three-level
###   Design, Discontinuity at Level 1)
### Aliases: bird3r1 cosa.bird3r1 mdes.bird3r1 power.bird3r1

### ** Examples

# cost constrained - optimize n2 and n3
cosa.bird3r1(constrain = "cost", cost = 5000,
             cn1 = c(5, 3), cn2 = 10, cn3 = 30,
             es = .20, rho2 = .20, rho3 = .10, omega2 = .20, omega3 = .10,
             r21 = .20, r2t2 = .20, r2t3 = .20, g3 = 1, p = .50,
             n1 = 25, n2 = NULL, n3 = NULL)

# minimum detectable effect size
mdes.bird3r1(power = .80, rho2 = .20, rho3 = .10, omega2 = .20, omega3 = .10,
             r21 = .20, r2t2 = .30, r2t3 = .40, g3 = 1, p = .50,
             n1 = 28.06, n2 = 3, n3 = 16)

# statistical power
power.bird3r1(es = .20, rho2 = .20, rho3 = .10, omega2 = .20, omega3 = .10,
              r21 = .20, r2t2 = .30, r2t3 = .40, g3 = 1, p = .50,
              n1 = 28.06, n2 = 3, n3 = 16)




