## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(comment = "#>", collapse = TRUE)

## ------------------------------------------------------------------------
library(revdbayes)
# Are microbenchmark and evdbayes available?
got_microbenchmark <- requireNamespace("microbenchmark", quietly = TRUE)
got_evdbayes <- requireNamespace("evdbayes", quietly = TRUE)
if (got_microbenchmark) {
  library(microbenchmark)
}
if (got_evdbayes) {
  library(evdbayes)
}
# Set the number of posterior samples required.
n <- 1000
set.seed(46)

## ------------------------------------------------------------------------
u <- quantile(gom, probs = 0.65)
fp <- set_prior(prior = "flat", model = "gp", min_xi = -1)
if (got_microbenchmark) {
  res <- microbenchmark(
    rpost = rpost(n = n, model = "gp", prior = fp, thresh = u, data = gom),
    rpost_rcpp = rpost_rcpp(n = n, model = "gp", prior = fp, thresh = u, 
                            data =   gom)
  )
  print(res, signif = 3)
  options(microbenchmark.unit = "relative")
  print(res, signif = 2)
}  

## ------------------------------------------------------------------------
mat <- diag(c(10000, 10000, 100))
pn <- set_prior(prior = "norm", model = "gev", mean = c(0,0,0), cov = mat)
# Tuning parameters from the evdbayes user guide.
t0 <- c(3.87, 0.2, -0.05) 
s <- c(.06, .25, .25)
if (got_microbenchmark) {
  if (got_evdbayes) {
    res <- microbenchmark(
      rpost = rpost(n = n, model = "gev", prior = pn, data = portpirie),
      rpost_rcpp = rpost_rcpp(n = n, model = "gev", prior = pn, 
                            data = portpirie),
      evdbayes = posterior(n = n, init = t0, prior = pn, lh = "gev", 
                         data = portpirie, psd = s, burn = 0)
    )
  } else {
    res <- microbenchmark(
      rpost = rpost(n = n, model = "gev", prior = pn, data = portpirie),
      rpost_rcpp = rpost_rcpp(n = n, model = "gev", prior = pn, 
                              data = portpirie)
    )
  }
  options(microbenchmark.unit = NULL)
  print(res, signif = 3)
  options(microbenchmark.unit = "relative")
  print(res, signif = 2)
}  

## ------------------------------------------------------------------------
# Informative prior set using revdbayes
pr2 <- set_prior(prob = 10^-(1:3), shape = c(38.9, 7.1, 47),
                 scale = c(1.5, 6.3, 2.6), model = "gev", prior = "quant")
# Tuning parameters from the evdbayes user guide.
t0 <- c(43.2, 7.64, 0.32) 
s <- c(2, .2, .07)
if (got_microbenchmark) {
  if (got_evdbayes) {
    # Informative prior set using evdbayes
    pr <- prior.quant(prob = 10^-(1:3), shape = c(38.9, 7.1, 47), 
                      scale = c(1.5, 6.3, 2.6))
    res <- microbenchmark(
      rpost = rpost(n = n, model = "pp", prior = pr2, data = rainfall,
                thresh = 40, noy = 54),
      rpost_rcpp = rpost_rcpp(n = n, model = "pp", prior = pr2, data = rainfall,
                          thresh = 40, noy = 54),
      evdbayes = posterior(n = n, init = t0, prior = pr, "pp", data = rainfall,
                       thresh = 40, noy = 54, psd = s, burn = 0)
    )
  } else {
    res <- microbenchmark(
      rpost = rpost(n = n, model = "pp", prior = pr2, data = rainfall,
                thresh = 40, noy = 54),
      rpost_rcpp = rpost_rcpp(n = n, model = "pp", prior = pr2, data = rainfall,
                          thresh = 40, noy = 54)
    )
  }  
  options(microbenchmark.unit = NULL)
  print(res, signif = 3)
  options(microbenchmark.unit = "relative")
  print(res, signif = 2)
}  

## ------------------------------------------------------------------------
# GP model, user-defined prior
ptr_gp_flat <- create_prior_xptr("gp_flat")
p_user <- set_prior(prior = ptr_gp_flat, model = "gp", min_xi = -1)
gpg <- rpost_rcpp(n = 1000, model = "gp", prior = p_user, thresh = u,
                  data = gom)

