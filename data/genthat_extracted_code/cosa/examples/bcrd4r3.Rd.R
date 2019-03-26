library(cosa)


### Name: bcrd4r3
### Title: Blocked Cluster-level Regression Discontinuity (Four-level
###   Design, Discontinuity at Level 3)
### Aliases: bcrd4r3 cosa.bcrd4r3 mdes.bcrd4r3 power.bcrd4r3

### ** Examples

# cost constrained - optimize n3 and n4
cosa.bcrd4r3(constrain = "cost", cost = 50000,
             cn1 = 5, cn2 = 10, cn3 = 30, cn4 = 50,
             es = .20, rho2 = .30, rho3 = .15, rho4 = .10, omega4 = .50,
             r21 = .50, r22 = .30, r23 = .20, r2t4 = .20,
             g4 = 1, p = .50, n1 = 25, n2 = 3, n3 = NULL, n4 = NULL)

# minimum detectable effect size
mdes.bcrd4r3(power = .80, rho2 = .20, rho3 = .10, rho4 = .05, omega4 = .20,
             r21 = .20, r22 = .30, r23 = .40, r2t4 = .50,
             g4 = 1, p = .50, n1 = 10, n2 = 3, n3 = 50.92, n4 = 13)

# statistical power
power.bcrd4r3(es = .20, rho2 = .20, rho3 = .10, rho4 = .05, omega4 = .20,
              r21 = .20, r22 = .30, r23 = .40, r2t4 = .50,
              g4 = 1, p = .50, n1 = 10, n2 = 3, n3 = 50.92, n4 = 13)



