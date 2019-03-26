library(nmathresh)


### Name: thresh_forest
### Title: Producing threshold forest plots
### Aliases: thresh_forest

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

# Get treatment codes for the contrasts with data
d.a <- d.b <- vector(length = nrow(X))
for (i in 1:nrow(X)){
  d.a[i] <- ifelse(any(X[i, ] == -1), which(X[i, ] == -1), 0) + 1
  d.b[i] <- ifelse(any(X[i, ] == 1), which(X[i, ] == 1), 0) + 1
}

# Transform from d_ab style contrast references into d[i] style from the full set of contrasts
# for easy indexing in R
d.i <- d_ab2i(d.a, d.b, K = 6)

# Create plot data
plotdat <- data.frame(lab = paste0(d.b, " vs. ", d.a),
                      contr.mean = Thrombo.post.summary$statistics[d.i, "Mean"],
                      CI2.5 = Thrombo.post.summary$quantiles[d.i, "2.5%"],
                      CI97.5 = Thrombo.post.summary$quantiles[d.i, "97.5%"])

# Plot
thresh_forest(thresh, contr.mean, CI2.5, CI97.5, label = lab, data = plotdat,
              label.title = "Contrast", xlab = "Log Odds Ratio", CI.title = "95% Credible Interval",
              xlim = c(-.3, .3), refline = 0, digits = 2)




