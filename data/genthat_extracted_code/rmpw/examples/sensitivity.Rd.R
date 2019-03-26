library(rmpw)


### Name: sensitivity
### Title: Sensitivity Analysis for Causal Mediation Analysis Using
###   Weighting Approach
### Aliases: sensitivity

### ** Examples

data(Riverside)
omit.bias = sensitivity(est.ie = -0.111, est.de = 0.158, est.se.ie = 0.059, 
    est.se.de = 0.108, outcome = "trunc_dep12sm2", mediator = "emp", 
    treatment = "treat", X = c("emp_prior", "pqtrunc50", "pqtrunc51", 
        "pqtrunc52", "pqtrunc53", "pqtrunc30", "hispanic", "pqtrunc49", 
        "nevmar"), X.omit.pre = c("AFDC3660", "pqtrunc25", "nohsdip"), 
    X.omit.post = "AFDC0_Y1", m.scale = "discrete", t.rand = TRUE, t.confound = FALSE, 
    data = Riverside)



