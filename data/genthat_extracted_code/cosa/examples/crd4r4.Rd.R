library(cosa)


### Name: crd4r4
### Title: Cluster-level Regression Discontinuity (Four-level Design,
###   Discontinuity at Level 1)
### Aliases: crd4r4 cosa.crd4r4 power.crd4r4 mdes.crd4r4

### ** Examples

# cost constrained - optimize n3 and n4
cosa.crd4r4(constrain = "cost", cost = 50000,
            cn1 = 2, cn2 = c(10, 8), cn3 = 20, cn4 = c(50,40),
            es = .20, rho2 = .20, rho3 = .10, rho4 = .05,
            r21 = .20, r22 = .30, r23 = .40, r24 = .50,
            g4 = 1, p = .50, n1 = 25, n2 = 3, n3 = NULL, n4 = NULL)

# minimum detectable effect size
mdes.crd4r4(power = .80, rho2 = .20, rho3 = .10, rho4 = .05,
            r21 = .20, r22 = .30, r23 = .40, r24 = .50,
            g4 = 1, p = .50, n1 = 10, n2 = 3, n3 = 51.7, n4 = 10)

# statistical power
power.crd4r4(es = .20, rho2 = .20, rho3 = .10, rho4 = .05,
             r21 = .20, r22 = .30, r23 = .40, r24 = .50,
             g4 = 1, p = .50, n1 = 10, n2 = 3, n3 = 51.7, n4 = 10)



