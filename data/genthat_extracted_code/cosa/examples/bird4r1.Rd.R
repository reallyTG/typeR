library(cosa)


### Name: bird4r1
### Title: Blocked Individual-level Regression Discontinuity (Four-level
###   Design, Discontinuity at Level 1)
### Aliases: bird4r1 cosa.bird4r1 mdes.bird4r1 power.bird4r1

### ** Examples

# cost constrained - optimize n3 and n4
cosa.bird4r1(constrain = "cost", cost = 20000,
             cn1 = c(5, 3), cn2 = 10, cn3 = 30, cn4 = 50,
             es = .20, rho2 = .20, rho3 = .10, rho4 = .05,
             omega2 = .20, omega3 = .10, omega4 = .10,
             r21 = .20, r2t2 = .20, r2t3 = .20, r2t4 = .20,
             g4 = 1, p = .50, n1 = 25, n2 = 3, n3 = NULL, n4 = NULL)

# minimum detectable effect size
mdes.bird4r1(power = .80, rho2 = .20, rho3 = .10, rho4 = .05,
             omega2 = .20, omega3 = .10, omega4 = .10,
             r21 = .20, r2t2 = .30, r2t3 = .40, r2t4 = .50,
             g4 = 1, p = .50, n1 = 11.74, n2 = 3, n3 = 50, n4 = 6)

# statistical power
power.bird4r1(es = .20, rho2 = .20, rho3 = .10, rho4 = .05,
              omega2 = .20, omega3 = .10, omega4 = .10,
              r21 = .20, r2t2 = .30, r2t3 = .40, r2t4 = .50,
              g4 = 1, p = .50, n1 = 11.74, n2 = 3, n3 = 50, n4 = 6)



