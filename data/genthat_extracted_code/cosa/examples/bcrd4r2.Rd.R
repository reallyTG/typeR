library(cosa)


### Name: bcrd4r2
### Title: Blocked Cluster-level Regression Discontinuity (Four-level
###   Design, Discontinuity at Level 2)
### Aliases: bcrd4r2 cosa.bcrd4r2 mdes.bcrd4r2 power.bcrd4r2

### ** Examples

# cost constrained - optimize n3 and n4
cosa.bcrd4r2(constrain = "cost", cost = 100000,
             cn1 = c(5, 3), cn2 = 10, cn3 = 30, cn4 = 50,
             es = .20, rho2 = .20, rho3 = .10, rho4 = .05,
             omega3 = .10, omega4 = .20,
             g4 = 1,r21 = .20, r22 = .20, r2t3 = .20, r2t4 = .20,
             p = .50, n1 = 25, n2 = 3, n3 = NULL, n4 = NULL)

# minimum detectable effect size
mdes.bcrd4r2(power = .80, rho2 = .20, rho3 = .10, rho4 = .05,
             omega3 = .10, omega4 = .20,
             r21 = .20, r22 = .30, r2t3 = .40, r2t4 = .50,
             g4 = 1, p = .50, n1 = 10, n2 = 3, n3 = 50.92, n4 = 13)

# statistical power
power.bcrd4r2(es = .20, rho2 = .20, rho3 = .10, rho4 = .05,
              omega3 = .10, omega4 = .20,
              r21 = .20, r22 = .30, r2t3 = .40, r2t4 = .50,
              g4 = 1, p = .50, n1 = 10, n2 = 3, n3 = 50.92, n4 = 13)



