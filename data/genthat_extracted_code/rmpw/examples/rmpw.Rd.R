library(rmpw)


### Name: rmpw
### Title: Causal Mediation Analysis Using Weighting Approach
### Aliases: rmpw

### ** Examples

data(Riverside)
rmpw(data = Riverside, treatment = "treat", mediator = "emp", 
    outcome = "trunc_dep12sm2", propensity_x = c("emp_prior", 
        "pqtrunc50", "pqtrunc51", "pqtrunc52", "pqtrunc53", "pqtrunc30", 
        "hispanic", "pqtrunc49", "nevmar"), outcome_x = c("emp_prior", 
        "pqtrunc50", "pqtrunc51", "pqtrunc52", "pqtrunc53", "pqtrunc30", 
        "hispanic", "pqtrunc49", "nevmar"), decomposition = 0)
rmpw(data = Riverside, treatment = "treat", mediator = "emp", 
    outcome = "trunc_dep12sm2", propensity_x = c("emp_prior", 
        "pqtrunc50", "pqtrunc51", "pqtrunc52", "pqtrunc53", "pqtrunc30", 
        "hispanic", "pqtrunc49", "nevmar"), outcome_x = c("emp_prior", 
        "pqtrunc50", "pqtrunc51", "pqtrunc52", "pqtrunc53", "pqtrunc30", 
        "hispanic", "pqtrunc49", "nevmar"), decomposition = 1)
rmpw(data = Riverside, treatment = "treat", mediator = "emp", 
    outcome = "trunc_dep12sm2", propensity_x = c("emp_prior", 
        "pqtrunc50", "pqtrunc51", "pqtrunc52", "pqtrunc53", "pqtrunc30", 
        "hispanic", "pqtrunc49", "nevmar"), outcome_x = c("emp_prior", 
        "pqtrunc50", "pqtrunc51", "pqtrunc52", "pqtrunc53", "pqtrunc30", 
        "hispanic", "pqtrunc49", "nevmar"), decomposition = 2)



