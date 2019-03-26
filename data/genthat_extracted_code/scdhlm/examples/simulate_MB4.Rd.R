library(scdhlm)


### Name: simulate_MB4
### Title: Simulate Model MB4 from Pustejovsky, Hedges, & Shadish (2014)
### Aliases: simulate_MB4

### ** Examples

simulate_MB4(iterations = 10, beta = c(0,1,0,0), rho = 0.8, phi = 0.5, 
             tau2_ratio = 0.5, tau_corr = 0, 
             p_const = c(0,1,0,7), r_const = c(1,0,1,0,0), 
             design = design_matrix(3, 16, treat_times=c(5,9,13), center = 12))
simulate_MB4(iterations = 10, beta = c(0,1,0,0), rho = 0.8, phi = 0.5, 
             tau2_ratio = 0.5, tau_corr = 0, m = 6, n = 8)



