library(nmathresh)


### Name: thresh_2d
### Title: Producing two-dimensional invariant regions
### Aliases: thresh_2d

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

# Thresholds are then
thresh <- nma_thresh(mean.dk = Thrombo.post.summary$statistics[1:(K-1), "Mean"],
                     lhood = lik.cov,
                     post = Thrombo.post.cov,
                     nmatype = "fixed",
                     X = X,
                     opt.max = FALSE)

# Produce an invariant region for simultaneous adjustments to both arms of Study 1
thresh_2d(thresh, 1, 2,
          xlab = "Adjustment in Study 1 LOR: 3 vs. 1",
          ylab = "Adjustment in Study 1 LOR: 4 vs. 1",
          xlim = c(-1.5, 0.5), ylim = c(-2, 14),
          ybreaks = seq(-2, 14, 2))




