library(cosa)


### Name: bcrd3r2
### Title: Blocked Cluster-level Regression Discontinuity (Three-level
###   Design, Discontinuity at Level 2)
### Aliases: bcrd3r2 cosa.bcrd3r2 mdes.bcrd3r2 power.bcrd3r2

### ** Examples

# cost constrained - optimize n2 and n3
cosa.bcrd3r2(constrain = "cost", cost = 20000,
             cn1 = c(5, 3), cn2 = 10, cn3 = 30,
             es = .20, rho2 = .20, rho3 = .10, omega3 = .10,
             r21 = .20, r22 = .20, r2t3 = .20,
             g3 = 1, p = .50, n1 = 25)

# minimum detectable effect size
mdes.bcrd3r2(power = .80, rho2 = .20, rho3 = .10, omega3 = .10,
             r21 = .20, r22 = .30, r2t3 = .40,
             g3 = 1, p = .50, n1 = 13.39, n2 = 3, n3 = 277)

# statistical power
power.bcrd3r2(es = .20, rho2 = .20, rho3 = .10, omega3 = .10,
              r21 = .20, r22 = .30, r2t3 = .40,
              g3 = 1, p = .50, n1 = 13.39, n2 = 3, n3 = 277)



