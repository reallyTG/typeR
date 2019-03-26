library(SimMultiCorrData)


### Name: plot_sim_theory
### Title: Plot Simulated Data and Target Distribution Data by Name or
###   Function for Continuous or Count Variables
### Aliases: plot_sim_theory
### Keywords: Fleishman, Headrick plot, simulated, theoretical,

### ** Examples

## Not run: 
##D # Logistic Distribution: mean = 0, variance = 1
##D seed = 1234
##D 
##D # Find standardized cumulants
##D stcum <- calc_theory(Dist = "Logistic", params = c(0, 1))
##D 
##D # Simulate without the sixth cumulant correction
##D # (invalid power method pdf)
##D Logvar1 <- nonnormvar1(method = "Polynomial", means = 0, vars = 1,
##D                        skews = stcum[3], skurts = stcum[4],
##D                        fifths = stcum[5], sixths = stcum[6],
##D                        n = 10000, seed = seed)
##D 
##D # Plot simulated variable (invalid) and data from theoretical distribution
##D plot_sim_theory(sim_y = Logvar1$continuous_variable,
##D                 title = "Invalid Logistic Simulated Data Values",
##D                 overlay = TRUE, Dist = "Logistic", params = c(0, 1),
##D                 seed = seed)
##D 
##D # Simulate with the sixth cumulant correction
##D # (valid power method pdf)
##D Logvar2 <- nonnormvar1(method = "Polynomial", means = 0, vars = 1,
##D                        skews = stcum[3], skurts = stcum[4],
##D                        fifths = stcum[5], sixths = stcum[6],
##D                        Six = seq(1.5, 2, 0.05), n = 10000, seed = seed)
##D 
##D # Plot simulated variable (valid) and data from theoretical distribution
##D plot_sim_theory(sim_y = Logvar2$continuous_variable,
##D                 title = "Valid Logistic Simulated Data Values",
##D                 overlay = TRUE, Dist = "Logistic", params = c(0, 1),
##D                 seed = seed)
##D 
##D # Simulate 2 Negative Binomial distributions and correlation 0.3
##D # using Method 1
##D NBvars <- rcorrvar(k_nb = 2, size = c(10, 15), prob = c(0.4, 0.3),
##D                    rho = matrix(c(1, 0.3, 0.3, 1), 2, 2), seed = seed)
##D 
##D # Plot pdfs of 1st simulated variable and theoretical distribution
##D plot_sim_theory(sim_y = NBvars$Neg_Bin_variable[, 1], overlay = TRUE,
##D                 cont_var = FALSE, Dist = "Negative_Binomial",
##D                 params = c(10, 0.4))
##D 
## End(Not run)




