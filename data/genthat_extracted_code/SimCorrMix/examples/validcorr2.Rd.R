library(SimCorrMix)


### Name: validcorr2
### Title: Determine Correlation Bounds for Ordinal, Continuous, Poisson,
###   and/or Negative Binomial Variables: Correlation Method 2
### Aliases: validcorr2
### Keywords: bounds correlation method2

### ** Examples

validcorr2(n = 1000, k_cat = 1, k_cont = 1, method = "Polynomial",
  means = 0, vars = 1, skews = 0, skurts = 0, fifths = 0, sixths = 0,
  marginal = list(c(1/3, 2/3)), rho = matrix(c(1, 0.4, 0.4, 1), 2, 2),
  quiet = TRUE)
## Not run: 
##D 
##D # 2 continuous mixture, 1 binary, 1 zero-inflated Poisson, and
##D # 1 zero-inflated NB variable
##D n <- 10000
##D seed <- 1234
##D 
##D # Mixture variables: Normal mixture with 2 components;
##D # mixture of Logistic(0, 1), Chisq(4), Beta(4, 1.5)
##D # Find cumulants of components of 2nd mixture variable
##D L <- calc_theory("Logistic", c(0, 1))
##D C <- calc_theory("Chisq", 4)
##D B <- calc_theory("Beta", c(4, 1.5))
##D 
##D skews <- skurts <- fifths <- sixths <- NULL
##D Six <- list()
##D mix_pis <- list(c(0.4, 0.6), c(0.3, 0.2, 0.5))
##D mix_mus <- list(c(-2, 2), c(L[1], C[1], B[1]))
##D mix_sigmas <- list(c(1, 1), c(L[2], C[2], B[2]))
##D mix_skews <- list(rep(0, 2), c(L[3], C[3], B[3]))
##D mix_skurts <- list(rep(0, 2), c(L[4], C[4], B[4]))
##D mix_fifths <- list(rep(0, 2), c(L[5], C[5], B[5]))
##D mix_sixths <- list(rep(0, 2), c(L[6], C[6], B[6]))
##D mix_Six <- list(list(NULL, NULL), list(1.75, NULL, 0.03))
##D Nstcum <- calc_mixmoments(mix_pis[[1]], mix_mus[[1]], mix_sigmas[[1]],
##D   mix_skews[[1]], mix_skurts[[1]], mix_fifths[[1]], mix_sixths[[1]])
##D Mstcum <- calc_mixmoments(mix_pis[[2]], mix_mus[[2]], mix_sigmas[[2]],
##D   mix_skews[[2]], mix_skurts[[2]], mix_fifths[[2]], mix_sixths[[2]])
##D means <- c(Nstcum[1], Mstcum[1])
##D vars <- c(Nstcum[2]^2, Mstcum[2]^2)
##D 
##D marginal <- list(0.3)
##D support <- list(c(0, 1))
##D lam <- 0.5
##D p_zip <- 0.1
##D pois_eps <- 0.0001
##D size <- 2
##D prob <- 0.75
##D p_zinb <- 0.2
##D nb_eps <- 0.0001
##D 
##D k_cat <- k_pois <- k_nb <- 1
##D k_cont <- 0
##D k_mix <- 2
##D Rey <- matrix(0.39, 8, 8)
##D diag(Rey) <- 1
##D rownames(Rey) <- colnames(Rey) <- c("O1", "M1_1", "M1_2", "M2_1", "M2_2",
##D   "M2_3", "P1", "NB1")
##D 
##D # set correlation between components of the same mixture variable to 0
##D Rey["M1_1", "M1_2"] <- Rey["M1_2", "M1_1"] <- 0
##D Rey["M2_1", "M2_2"] <- Rey["M2_2", "M2_1"] <- Rey["M2_1", "M2_3"] <- 0
##D Rey["M2_3", "M2_1"] <- Rey["M2_2", "M2_3"] <- Rey["M2_3", "M2_2"] <- 0
##D 
##D # check parameter inputs
##D validpar(k_cat, k_cont, k_mix, k_pois, k_nb, "Polynomial", means,
##D   vars, skews, skurts, fifths, sixths, Six, mix_pis, mix_mus, mix_sigmas,
##D   mix_skews, mix_skurts, mix_fifths, mix_sixths, mix_Six, marginal, support,
##D   lam, p_zip, size, prob, mu = NULL, p_zinb, pois_eps, nb_eps, Rey)
##D 
##D # check to make sure Rey is within the feasible correlation boundaries
##D validcorr2(n, k_cat, k_cont, k_mix, k_pois, k_nb, "Polynomial", means,
##D   vars, skews, skurts, fifths, sixths, Six, mix_pis, mix_mus, mix_sigmas,
##D   mix_skews, mix_skurts, mix_fifths, mix_sixths, mix_Six, marginal,
##D   lam, p_zip, size, prob, mu = NULL, p_zinb, pois_eps, nb_eps, Rey, seed)
## End(Not run)



