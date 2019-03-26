library(cosa)


### Name: crd2r2
### Title: Cluster-level Regression Discontinuity (Two-level Design,
###   Discontinuity at Level 2, w/ or w/o Strata or Fixed Blocks)
### Aliases: crd2r2 bcrd3f2 cosa.crd2r2 cosa.bcrd3f2 power.crd2r2
###   power.bcrd3f2 mdes.crd2r2 mdes.bcrd3f2

### ** Examples

# cost constrained - optimize n1 and n2
cosa.crd2r2(constrain = "cost", cost = 50000,
            cn1 = 5, cn2 = c(10, 8),
            es = .20, rho2 = .20, r21 = .20, r22 = .30,
            g2 = 1, p = .50, n1 = NULL, n2 = NULL)

# minimum detectable effect size
mdes.crd2r2(power = .80, rho2 = .20, r21 = .20, r22 = .30,
            g2 = 1, p = .50, n1 = 16.04, n2 = 570)

# statistical power
power.crd2r2(es = .20, rho2 = .20, r21 = .20, r22 = .30,
             g2 = 1, p = .50, n1 = 16.04, n2 = 570)



