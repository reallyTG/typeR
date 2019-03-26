library(SimMultiCorrData)


### Name: rcorrvar
### Title: Generation of Correlated Ordinal, Continuous, Poisson, and/or
###   Negative Binomial Variables: Correlation Method 1
### Aliases: rcorrvar
### Keywords: Binomial, Fleishman, Headrick, Negative Poisson, continuous,
###   method1 ordinal, simulation,

### ** Examples

Sim1 <- rcorrvar(n = 1000, k_cat = 1, k_cont = 1, method = "Polynomial",
  means = 0, vars = 1, skews = 0, skurts = 0, fifths = 0, sixths = 0,
  marginal = list(c(1/3, 2/3)), support = list(0:2),
  rho = matrix(c(1, 0.4, 0.4, 1), 2, 2))

## Not run: 
##D 
##D # Binary, Ordinal, Continuous, Poisson, and Negative Binomial Variables
##D 
##D options(scipen = 999)
##D seed <- 1234
##D n <- 10000
##D 
##D Dist <- c("Logistic", "Weibull")
##D Params <- list(c(0, 1), c(3, 5))
##D Stcum1 <- calc_theory(Dist[1], Params[[1]])
##D Stcum2 <- calc_theory(Dist[2], Params[[2]])
##D Stcum <- rbind(Stcum1, Stcum2)
##D rownames(Stcum) <- Dist
##D colnames(Stcum) <- c("mean", "sd", "skew", "skurtosis", "fifth", "sixth")
##D Stcum
##D Six <- list(seq(1.7, 1.8, 0.01), seq(0.10, 0.25, 0.01))
##D marginal <- list(0.3)
##D lam <- 0.5
##D size <- 2
##D prob <- 0.75
##D 
##D Rey <- matrix(0.4, 5, 5)
##D diag(Rey) <- 1
##D 
##D # Make sure Rey is within upper and lower correlation limits
##D valid <- valid_corr(k_cat = 1, k_cont = 2, k_pois = 1, k_nb = 1,
##D                     method = "Polynomial", means = Stcum[, 1],
##D                     vars = Stcum[, 2]^2, skews = Stcum[, 3],
##D                     skurts = Stcum[, 4], fifths = Stcum[, 5],
##D                     sixths = Stcum[, 6], Six = Six, marginal = marginal,
##D                     lam = lam, size = size, prob = prob, rho = Rey,
##D                     seed = seed)
##D 
##D # Simulate variables without error loop
##D Sim1 <- rcorrvar(n = n, k_cat = 1, k_cont = 2, k_pois = 1, k_nb = 1,
##D                  method = "Polynomial", means = Stcum[, 1],
##D                  vars = Stcum[, 2]^2, skews = Stcum[, 3],
##D                  skurts = Stcum[, 4], fifths = Stcum[, 5],
##D                  sixths = Stcum[, 6], Six = Six, marginal = marginal,
##D                  lam = lam, size = size, prob = prob, rho = Rey,
##D                  seed = seed)
##D names(Sim1)
##D 
##D # Look at the maximum correlation error
##D Sim1$maxerr
##D 
##D Sim1_error = round(Sim1$correlations - Rey, 6)
##D 
##D # interquartile-range of correlation errors
##D quantile(as.numeric(Sim1_error), 0.25)
##D quantile(as.numeric(Sim1_error), 0.75)
##D 
##D # Simulate variables with error loop
##D Sim1_EL <- rcorrvar(n = n, k_cat = 1, k_cont = 2,
##D                     k_pois = 1, k_nb = 1, method = "Polynomial",
##D                     means = Stcum[, 1], vars = Stcum[, 2]^2,
##D                     skews = Stcum[, 3], skurts = Stcum[, 4],
##D                     fifths = Stcum[, 5], sixths = Stcum[, 6],
##D                     Six = Six, marginal = marginal, lam = lam,
##D                     size = size, prob = prob, rho = Rey,
##D                     seed = seed, errorloop = TRUE)
##D # Look at the maximum correlation error
##D Sim1_EL$maxerr
##D 
##D EL_error = round(Sim1_EL$correlations - Rey, 6)
##D 
##D # interquartile-range of correlation errors
##D quantile(as.numeric(EL_error), 0.25)
##D quantile(as.numeric(EL_error), 0.75)
##D 
##D # Look at results
##D # Ordinal variables
##D Sim1_EL$summary_ordinal
##D 
##D # Continuous variables
##D round(Sim1_EL$constants, 6)
##D round(Sim1_EL$summary_continuous, 6)
##D round(Sim1_EL$summary_targetcont, 6)
##D Sim1_EL$valid.pdf
##D 
##D # Count variables
##D Sim1_EL$summary_Poisson
##D Sim1_EL$summary_Neg_Bin
##D 
##D # Generate Plots
##D 
##D # Logistic (1st continuous variable)
##D # 1) Simulated Data CDF (find cumulative probability up to y = 0.5)
##D plot_sim_cdf(Sim1_EL$continuous_variables[, 1], calc_cprob = TRUE,
##D              delta = 0.5)
##D 
##D # 2) Simulated Data and Target Distribution PDFs
##D plot_sim_pdf_theory(Sim1_EL$continuous_variables[, 1], Dist = "Logistic",
##D                     params = c(0, 1))
##D 
##D # 3) Simulated Data and Target Distribution
##D plot_sim_theory(Sim1_EL$continuous_variables[, 1], Dist = "Logistic",
##D                 params = c(0, 1))
##D 
## End(Not run)



