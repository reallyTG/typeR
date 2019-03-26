library(scdhlm)


### Name: simulate_MB2
### Title: Simulate Model MB2 from Pustejovsky, Hedges, & Shadish (2014)
### Aliases: simulate_MB2

### ** Examples

set.seed(8)
simulate_MB2(iterations = 10, beta = c(0,1,0,0), rho = 0.4, phi = 0.5, 
             tau1_ratio = 0.5, tau_corr = -0.4, design = design_matrix(m=3, n=8))
set.seed(8)
simulate_MB2(iterations = 10, beta = c(0,1,0,0), rho = 0.4, phi = 0.5, 
             tau1_ratio = 0.5, tau_corr = -0.4, m = 3, n = 8, MB = FALSE)



