library(SimMultiCorrData)


### Name: plot_sim_ext
### Title: Plot Simulated Data and Target External Data for Continuous or
###   Count Variables
### Aliases: plot_sim_ext
### Keywords: Fleishman, Headrick external, plot, simulated,

### ** Examples

## Not run: 
##D # Logistic Distribution: mean = 0, variance = 1
##D 
##D seed = 1234
##D 
##D # Simulate "external" data set
##D set.seed(seed)
##D ext_y <- rlogis(10000)
##D 
##D # Find standardized cumulants
##D stcum <- calc_theory(Dist = "Logistic", params = c(0, 1))
##D 
##D # Simulate without the sixth cumulant correction
##D # (invalid power method pdf)
##D Logvar1 <- nonnormvar1(method = "Polynomial", means = 0, vars = 1,
##D                       skews = stcum[3], skurts = stcum[4],
##D                       fifths = stcum[5], sixths = stcum[6],
##D                       n = 10000, seed = seed)
##D 
##D # Plot simulated variable and external data
##D plot_sim_ext(sim_y = Logvar1$continuous_variable,
##D              title = "Invalid Logistic Simulated Data Values",
##D              ext_y = ext_y)
##D 
##D # Simulate with the sixth cumulant correction
##D # (valid power method pdf)
##D Logvar2 <- nonnormvar1(method = "Polynomial", means = 0, vars = 1,
##D                       skews = stcum[3], skurts = stcum[4],
##D                       fifths = stcum[5], sixths = stcum[6],
##D                       Six = seq(1.5, 2, 0.05), n = 10000, seed = seed)
##D 
##D # Plot simulated variable and external data
##D plot_sim_ext(sim_y = Logvar2$continuous_variable,
##D              title = "Valid Logistic Simulated Data Values",
##D              ext_y = ext_y)
##D 
##D # Simulate 2 Poisson distributions (means = 10, 15) and correlation 0.3
##D # using Method 1
##D Pvars <- rcorrvar(k_pois = 2, lam = c(10, 15),
##D                   rho = matrix(c(1, 0.3, 0.3, 1), 2, 2), seed = seed)
##D 
##D # Simulate "external" data set
##D set.seed(seed)
##D ext_y <- rpois(10000, 10)
##D 
##D # Plot 1st simulated variable and external data
##D plot_sim_ext(sim_y = Pvars$Poisson_variable[, 1], ext_y = ext_y)
##D 
## End(Not run)




