## ---- echo = FALSE-------------------------------------------------------
#knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
knitr::opts_chunk$set(fig.width = 6, fig.height = 4.5) 

## ---- warning = FALSE, message = FALSE-----------------------------------
library("SimMultiCorrData")
library("printr")

# Turn off scientific notation
options(scipen = 999)

# Set seed and sample size
seed <- 11
n <- 10000

# Continuous Distributions
Dist <- c("Gaussian", "Chisq", "Beta")

# Calculate standardized cumulants
# Those for the normal distribution are rounded to ensure the correct values 
# are obtained.
M1 <- round(calc_theory(Dist = "Gaussian", params = c(0, 1)), 8)
M2 <- calc_theory(Dist = "Chisq", params = 4)
M3 <- calc_theory(Dist = "Beta", params = c(4, 2))
M <- cbind(M1, M2, M3)

# Binary and Ordinal Distributions
marginal <- list(c(0.3, 0.75), c(0.2, 0.5, 0.9))
support <- list() # default support will be generated inside simulation

# Poisson Distributions
lam <- c(1, 5, 10)

# Negative Binomial Distributions
size <- c(3, 6)
prob <- c(0.2, 0.8)

ncat <- length(marginal)
ncont <- ncol(M)
npois <- length(lam)
nnb <- length(size)

# Create correlation matrix from a uniform distribution (0.2, 0.7)
set.seed(seed)
Rey <- diag(1, nrow = (ncat + ncont + npois + nnb))
for (i in 1:nrow(Rey)) {
  for (j in 1:ncol(Rey)) {
    if (i > j) Rey[i, j] <- runif(1, 0.2, 0.7)
    Rey[j, i] <- Rey[i, j]
  }
}

# Check to see if Rey is positive-definite
min(eigen(Rey, symmetric = TRUE)$values) < 0

## ---- warning = FALSE----------------------------------------------------
Lower <- list()

# list of standardized kurtosis values to add in case only invalid power 
#     method pdfs are produced
Skurt <- list(seq(0.5, 2, 0.5), seq(0.02, 0.05, 0.01), seq(0.02, 0.05, 0.01))

start.time <- Sys.time()
for (i in 1:ncol(M)) {
  Lower[[i]] <- calc_lower_skurt(method = "Polynomial", skews = M[3, i], 
                                 fifths = M[5, i], sixths = M[6, i], 
                                 Skurt = Skurt[[i]], seed = 104)
}
stop.time <- Sys.time()
Time <- round(difftime(stop.time, start.time, units = "min"), 3)
cat("Total computation time:", Time, "minutes \n")

# Note the message given for Distribution 1 (Normal).

## ------------------------------------------------------------------------
as.matrix(Lower[[1]]$Min[1, c("skew", "fifth", "sixth", "valid.pdf", 
                              "skurtosis")], 
          nrow = 1, ncol = 5, byrow = TRUE) 

## ------------------------------------------------------------------------
as.matrix(Lower[[2]]$Min[1, c("skew", "fifth", "sixth", "valid.pdf", 
                              "skurtosis")], 
          nrow = 1, ncol = 5, byrow = TRUE) 
Lower[[2]]$SkurtCorr1

## ------------------------------------------------------------------------
as.matrix(Lower[[3]]$Min[1, c("skew", "fifth", "sixth", "valid.pdf", 
                              "skurtosis")], 
          nrow = 1, ncol = 5, byrow = TRUE) 
Lower[[3]]$SkurtCorr1

## ---- warning = FALSE----------------------------------------------------
# Make sure Rey is within upper and lower correlation limits
valid <- valid_corr(k_cat = ncat, k_cont = ncont, k_pois = npois,
                    k_nb = nnb, method = "Polynomial", means =  M[1, ],
                    vars =  (M[2, ])^2, skews = M[3, ], skurts = M[4, ],
                    fifths = M[5, ], sixths = M[6, ], marginal = marginal, 
                    lam = lam, size = size, prob = prob, rho = Rey, 
                    seed = seed)

## ---- warning = FALSE, message = FALSE-----------------------------------
A <- rcorrvar(n = 10000, k_cont = ncont, k_cat = ncat, k_pois = npois,
              k_nb = nnb, method = "Polynomial", means =  M[1, ], 
              vars =  (M[2, ])^2, skews = M[3, ], skurts = M[4, ], 
              fifths = M[5, ], sixths = M[6, ], marginal = marginal,
              lam = lam, size = size, prob = prob, rho = Rey, seed = seed)

## ------------------------------------------------------------------------
Acorr_error = round(A$correlations - Rey, 6)
summary(as.numeric(Acorr_error))

## ---- warning = FALSE, message = FALSE-----------------------------------
B <- rcorrvar(n = 10000, k_cont = ncont, k_cat = ncat, k_pois = npois,
              k_nb = nnb, method = "Polynomial", means =  M[1, ], 
              vars =  (M[2, ])^2, skews = M[3, ], skurts = M[4, ], 
              fifths = M[5, ], sixths = M[6, ], marginal = marginal,
              lam = lam, size = size, prob = prob, rho = Rey, seed = seed, 
              errorloop = TRUE)

## ------------------------------------------------------------------------
Bcorr_error = round(B$correlations - Rey, 6)
summary(as.numeric(Bcorr_error))

## ------------------------------------------------------------------------
knitr::kable(B$summary_ordinal[[1]], caption = "Variable 1")
knitr::kable(B$summary_ordinal[[2]], caption = "Variable 2")

## ------------------------------------------------------------------------
as.matrix(B$summary_Poisson[, c(1, 3:6, 8:9)], nrow = 3, ncol = 7, 
          byrow = TRUE)

## ------------------------------------------------------------------------
as.matrix(B$summary_Neg_Bin[, c(1, 3:7, 9:10)], nrow = 2, ncol = 8, 
          byrow = TRUE)

## ------------------------------------------------------------------------
as.matrix(round(B$constants, 6), nrow = 3, ncol = 6, byrow = TRUE)

## ------------------------------------------------------------------------
as.matrix(round(B$summary_targetcont, 5), nrow = 3, ncol = 7, byrow = TRUE)

## ------------------------------------------------------------------------
as.matrix(round(B$summary_continuous[, c("Distribution", "mean", "sd", 
                                         "skew", "skurtosis", "fifth", 
                                         "sixth")], 5), nrow = 3, ncol = 7, 
          byrow = TRUE)

## ------------------------------------------------------------------------
B$valid.pdf

## ---- warning = FALSE, message = FALSE-----------------------------------
as.matrix(t(round(stats_pdf(c = B$constants[1, ], method = "Polynomial", 
                            alpha = 0.025), 4)))

## ---- warning = FALSE, message = FALSE-----------------------------------
as.matrix(t(round(stats_pdf(c = B$constants[2, ], method = "Polynomial", 
                            alpha = 0.025), 4)))

## ---- warning = FALSE, message = FALSE-----------------------------------
as.matrix(t(round(stats_pdf(c = B$constants[3, ], method = "Polynomial", 
                            alpha = 0.025), 4)))

## ---- warning = FALSE, message = FALSE-----------------------------------
plot_sim_cdf(B$continuous_variables[, 2], calc_cprob = TRUE, delta = 10)

## ---- warning = FALSE, message = FALSE-----------------------------------
plot_sim_pdf_theory(B$continuous_variables[, 2], Dist = "Chisq", params = 4)

## ---- warning = FALSE, message = FALSE-----------------------------------
plot_sim_cdf(B$ordinal_variables[, 2])

## ---- warning = FALSE, message = FALSE-----------------------------------
plot_sim_theory(B$Poisson_variables[, 2], cont_var = FALSE, Dist = "Poisson", 
                params = 5)

## ---- warning = FALSE, message = FALSE-----------------------------------
plot_sim_pdf_theory(B$Poisson_variables[, 2], cont_var = FALSE, 
                    Dist = "Poisson", params = 5)

## ---- warning = FALSE, message = FALSE-----------------------------------
plot_sim_theory(B$Neg_Bin_variables[, 1], cont_var = FALSE, 
                Dist = "Negative_Binomial", params = c(3, 0.2))

## ---- warning = FALSE, message = FALSE-----------------------------------
plot_sim_pdf_theory(B$Neg_Bin_variables[, 1], cont_var = FALSE, 
                Dist = "Negative_Binomial", params = c(3, 0.2))

## ---- warning = FALSE----------------------------------------------------
pois_eps <- rep(0.0001, npois)
nb_eps <- rep(0.0001, nnb)

# Make sure Rey is within upper and lower correlation limits
valid2 <- valid_corr2(k_cat = ncat, k_cont = ncont, k_pois = npois,
                      k_nb = nnb, method = "Polynomial", means =  M[1, ],
                      vars =  (M[2, ])^2, skews = M[3, ], skurts = M[4, ],
                      fifths = M[5, ], sixths = M[6, ], marginal = marginal, 
                      lam = lam, pois_eps = pois_eps, size = size, 
                      prob = prob, nb_eps = nb_eps, rho = Rey, seed = seed)

## ---- warning = FALSE, message = FALSE-----------------------------------
C <- rcorrvar2(n = 10000, k_cont = ncont, k_cat = ncat, k_pois = npois,
               k_nb = nnb, method = "Polynomial", means =  M[1, ], 
               vars =  (M[2, ])^2, skews = M[3, ], skurts = M[4, ], 
               fifths = M[5, ], sixths = M[6, ], marginal = marginal, 
               lam = lam, pois_eps = pois_eps, size = size, prob = prob, 
               nb_eps = nb_eps, rho = Rey, seed = seed)

## ------------------------------------------------------------------------
Ccorr_error = round(C$correlations - Rey, 6)
summary(as.numeric(Ccorr_error))

## ---- warning = FALSE, message = FALSE-----------------------------------
D <- rcorrvar2(n = 10000, k_cont = ncont, k_cat = ncat, k_pois = npois,
               k_nb = nnb, method = "Polynomial", means =  M[1, ], 
               vars =  (M[2, ])^2, skews = M[3, ], skurts = M[4, ], 
               fifths = M[5, ], sixths = M[6, ], marginal = marginal, 
               lam = lam, pois_eps = pois_eps, size = size, prob = prob, 
               nb_eps = nb_eps, rho = Rey, seed = seed, errorloop = TRUE)

## ------------------------------------------------------------------------
Dcorr_error = round(D$correlations - Rey, 6)
summary(as.numeric(Dcorr_error))

## ------------------------------------------------------------------------
knitr::kable(D$summary_ordinal[[1]], caption = "Variable 1")
knitr::kable(D$summary_ordinal[[2]], caption = "Variable 2")

## ------------------------------------------------------------------------
as.matrix(D$summary_Poisson[, c(1, 3:6, 8:9)], nrow = 3, ncol = 7, 
          byrow = TRUE)

## ------------------------------------------------------------------------
as.matrix(D$summary_Neg_Bin[, c(1, 3:7, 9:10)], nrow = 2, ncol = 8, 
          byrow = TRUE)

## ------------------------------------------------------------------------
as.matrix(round(D$summary_targetcont, 5), nrow = 3, ncol = 7, byrow = TRUE)

## ------------------------------------------------------------------------
as.matrix(round(D$summary_continuous[, c("Distribution", "mean", "sd", 
                                         "skew", "skurtosis", "fifth", 
                                         "sixth")], 5), nrow = 3, ncol = 7, 
          byrow = TRUE)

## ------------------------------------------------------------------------
D$valid.pdf

## ---- warning = FALSE, message = FALSE-----------------------------------
as.matrix(t(round(stats_pdf(c = D$constants[1, ], method = "Polynomial", 
                            alpha = 0.025), 4)))

## ---- warning = FALSE, message = FALSE-----------------------------------
as.matrix(t(round(stats_pdf(c = B$constants[2, ], method = "Polynomial", 
                            alpha = 0.025), 4)))

## ---- warning = FALSE, message = FALSE-----------------------------------
as.matrix(t(round(stats_pdf(c = B$constants[3, ], method = "Polynomial", 
                            alpha = 0.025), 4)))

## ---- warning = FALSE, message = FALSE-----------------------------------
plot_sim_theory(D$Poisson_variables[, 2], cont_var = FALSE, Dist = "Poisson", 
                params = 5)

## ---- warning = FALSE, message = FALSE-----------------------------------
plot_sim_pdf_theory(D$Poisson_variables[, 2], cont_var = FALSE, 
                    Dist = "Poisson", params = 5)

## ---- warning = FALSE, message = FALSE-----------------------------------
plot_sim_theory(D$Neg_Bin_variables[, 1], cont_var = FALSE, 
                Dist = "Negative_Binomial", params = c(3, 0.2))

## ---- warning = FALSE, message = FALSE-----------------------------------
plot_sim_pdf_theory(D$Neg_Bin_variables[, 1], cont_var = FALSE, 
                    Dist = "Negative_Binomial", params = c(3, 0.2))

