library(nmathresh)


### Name: recon_vcov
### Title: Reconstruct likelihood covariance matrix
### Aliases: recon_vcov

### ** Examples

# Please see the vignette "Examples" for worked examples including use of
# this function, including more information on the brief code below.

vignette("Examples", package = "nmathresh")

### Contrast level thresholds for Thrombolytic treatments NMA
K <- 6   # Number of treatments

# Contrast design matrix is
X <- matrix(ncol = K-1, byrow = TRUE,
            c(1, 0, 0, 0, 0,
              0, 1, 0, 0, 0,
              0, 0, 1, 0, 0,
              0, 0, 0, 1, 0,
              0, -1, 1, 0, 0,
              0, -1, 0, 1, 0,
              0, -1, 0, 0, 1))

# Reconstruct hypothetical likelihood covariance matrix using NNLS
lik.cov <- recon_vcov(Thrombo.post.cov, prior.prec = .0001, X = X)




