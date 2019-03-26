library(SimCorrMix)


### Name: intercorr2
### Title: Calculate Intermediate MVN Correlation for Ordinal, Continuous,
###   Poisson, or Negative Binomial Variables: Correlation Method 2
### Aliases: intercorr2
### Keywords: correlation method2

### ** Examples

Sigma1 <- intercorr2(k_cat = 1, k_cont = 1, method = "Polynomial",
  constants = matrix(c(0, 1, 0, 0, 0, 0), 1, 6), marginal = list(0.3),
  support = list(c(0, 1)), rho = matrix(c(1, 0.4, 0.4, 1), 2, 2),
  quiet = TRUE)
## Not run: 
##D 
##D # 1 continuous mixture, 1 binary, 1 zero-inflated Poisson, and
##D # 1 zero-inflated NB variable
##D # The defaults of pois_eps <- nb_eps <- 0.0001 are used.
##D 
##D # Mixture of N(-2, 1) and N(2, 1)
##D constants <- rbind(c(0, 1, 0, 0, 0, 0), c(0, 1, 0, 0, 0, 0))
##D 
##D marginal <- list(0.3)
##D support <- list(c(0, 1))
##D lam <- 0.5
##D p_zip <- 0.1
##D size <- 2
##D prob <- 0.75
##D p_zinb <- 0.2
##D 
##D k_cat <- k_pois <- k_nb <- 1
##D k_cont <- 2
##D Rey <- matrix(0.35, 5, 5)
##D diag(Rey) <- 1
##D rownames(Rey) <- colnames(Rey) <- c("O1", "M1_1", "M1_2", "P1", "NB1")
##D 
##D # set correlation between components of the same mixture variable to 0
##D Rey["M1_1", "M1_2"] <- Rey["M1_2", "M1_1"] <- 0
##D 
##D Sigma2 <- intercorr2(k_cat, k_cont, k_pois, k_nb, "Polynomial", constants,
##D   marginal, support, lam, p_zip, size, prob, mu = NULL, p_zinb, rho = Rey)
## End(Not run)



