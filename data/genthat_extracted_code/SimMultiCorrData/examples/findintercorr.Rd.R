library(SimMultiCorrData)


### Name: findintercorr
### Title: Calculate Intermediate MVN Correlation for Ordinal, Continuous,
###   Poisson, or Negative Binomial Variables: Correlation Method 1
### Aliases: findintercorr
### Keywords: Binomial, Fleishman, Headrick, Negative Poisson, continuous,
###   correlation, intermediate, method1 ordinal,

### ** Examples

## Not run: 
##D 
##D # Binary, Ordinal, Continuous, Poisson, and Negative Binomial Variables
##D 
##D options(scipen = 999)
##D seed <- 1234
##D n <- 10000
##D 
##D # Continuous Distributions: Normal, t (df = 10), Chisq (df = 4),
##D # Beta (a = 4, b = 2), Gamma (a = 4, b = 4)
##D Dist <- c("Gaussian", "t", "Chisq", "Beta", "Gamma")
##D 
##D # calculate standardized cumulants
##D # those for the normal and t distributions are rounded to ensure the
##D # correct values (i.e. skew = 0)
##D 
##D M1 <- round(calc_theory(Dist = "Gaussian", params = c(0, 1)), 8)
##D M2 <- round(calc_theory(Dist = "t", params = 10), 8)
##D M3 <- calc_theory(Dist = "Chisq", params = 4)
##D M4 <- calc_theory(Dist = "Beta", params = c(4, 2))
##D M5 <- calc_theory(Dist = "Gamma", params = c(4, 4))
##D M <- cbind(M1, M2, M3, M4, M5)
##D M <- round(M[-c(1:2),], digits = 6)
##D colnames(M) <- Dist
##D rownames(M) <- c("skew", "skurtosis", "fifth", "sixth")
##D means <- rep(0, length(Dist))
##D vars <- rep(1, length(Dist))
##D 
##D # calculate constants
##D con <- matrix(1, nrow = ncol(M), ncol = 6)
##D for (i in 1:ncol(M)) {
##D  con[i, ] <- find_constants(method = "Polynomial", skews = M[1, i],
##D                             skurts = M[2, i], fifths = M[3, i],
##D                             sixths = M[4, i])
##D }
##D 
##D # Binary and Ordinal Distributions
##D marginal <- list(0.3, 0.4, c(0.1, 0.5), c(0.3, 0.6, 0.9),
##D                  c(0.2, 0.4, 0.7, 0.8))
##D support <- list()
##D 
##D # Poisson Distributions
##D lam <- c(1, 5, 10)
##D 
##D # Negative Binomial Distributions
##D size <- c(3, 6)
##D prob <- c(0.2, 0.8)
##D 
##D ncat <- length(marginal)
##D ncont <- ncol(M)
##D npois <- length(lam)
##D nnb <- length(size)
##D 
##D # Create correlation matrix from a uniform distribution (-0.8, 0.8)
##D set.seed(seed)
##D Rey <- diag(1, nrow = (ncat + ncont + npois + nnb))
##D for (i in 1:nrow(Rey)) {
##D   for (j in 1:ncol(Rey)) {
##D     if (i > j) Rey[i, j] <- runif(1, -0.8, 0.8)
##D     Rey[j, i] <- Rey[i, j]
##D   }
##D }
##D 
##D # Test for positive-definiteness
##D library(Matrix)
##D if(min(eigen(Rey, symmetric = TRUE)$values) < 0) {
##D   Rey <- as.matrix(nearPD(Rey, corr = T, keepDiag = T)$mat)
##D }
##D 
##D # Make sure Rey is within upper and lower correlation limits
##D valid <- valid_corr(k_cat = ncat, k_cont = ncont, k_pois = npois,
##D                     k_nb = nnb, method = "Polynomial", means = means,
##D                     vars = vars, skews = M[1, ], skurts = M[2, ],
##D                     fifths = M[3, ], sixths = M[4, ], marginal = marginal,
##D                     lam = lam, size = size, prob = prob, rho = Rey,
##D                     seed = seed)
##D 
##D # Find intermediate correlation
##D Sigma1 <- findintercorr(n = n, k_cont = ncont, k_cat = ncat, k_pois = npois,
##D                         k_nb = nnb, method = "Polynomial", constants = con,
##D                         marginal = marginal, lam = lam, size = size,
##D                         prob = prob, rho = Rey, seed = seed)
##D Sigma1
##D 
## End(Not run)



