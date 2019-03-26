library(cosa)


### Name: crd3r3
### Title: Cluster-level Regression Discontinuity (Three-level Design,
###   Discontinuity at Level 3, w/ or w/o Strata or Fixed Blocks)
### Aliases: crd3r3 bcrd4f3 cosa.crd3r3 cosa.bcrd4f3 power.crd3r3
###   power.bcrd4f3 mdes.crd3r3 mdes.bcrd4f3

### ** Examples

# cost constrained - optimize n2 and n3
cosa.crd3r3(constrain = "cost", cost = 100000,
            cn1 = 5, cn2 = c(10, 5), cn3 = c(30, 10),
            es = .20, rho2 = .20, rho3 = .10,
            r21 = .20, r22 = .30, r23 = .40,
            g3 = 1, p = .50, n1 = 25, n2 = NULL, n3 = NULL)

# minimum detectable effect size
mdes.crd3r3(power = .80, rho2 = .20, rho3 = .10,
            r21 = .20, r22 = .30, r23 = .40,
            g3 = 1, p = .50, n1 = 19.39, n2 = 3, n3 = 300)

# statistical power
power.crd3r3(es = .20, rho2 = .20, rho3 = .10,
             r21 = .20, r22 = .30, r23 = .40,
             g3 = 1, p = .50, n1 = 19.39, n2 = 3, n3 = 300)



