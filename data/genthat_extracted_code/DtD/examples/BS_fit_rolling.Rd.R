library(DtD)


### Name: BS_fit_rolling
### Title: Fit Black-Scholes Parameters Over Rolling Window
### Aliases: BS_fit_rolling

### ** Examples

# Simulate data
set.seed(55770945)
n <- 21L * 3L * 12L # 21 trading days for 3 years w/ 12 months
sims <- BS_sim(
  vol = .1, mu = .05, dt = .1, V_0 = 100, T. = 1,
  D = runif(n, 80, 90), r = runif(n, 0, .01))
sims$month <- (1:nrow(sims) - 1L) %/% 21L + 1L

# throw out some months
sims <- subset(sims, !month %in% 15:24)

# assign parameters
grp <- sims$month
width <- 12L        # window w/ 12 month width
min_obs <- 21L * 3L # require 3 months of data

# estimate results with R loop which is slightly simpler then the
# implementation
grps <- unique(grp)
out <- matrix(
  NA_real_, nrow = length(grps), ncol = 6,
  dimnames = list(NULL, c("mu", "vol", "n_iter", "success", "n_obs", "grp")))
for(g in grps){
  idx <- which(grps == g)
  keep <- which(grp %in% (g - width + 1L):g)
  out[idx, c("n_obs", "grp")] <- c(length(keep), g)
  if(length(keep) < min_obs)
    next
  res <- with(
    sims[keep, ],
    BS_fit(S = S, D = D, T. = T, r = r, time = time, method = "iterative",
           vol_start = 1))
  out[idx, c("mu", "vol", "n_iter", "success")] <- rep(
    do.call(c, res[c("ests", "n_iter", "success")]), each = length(idx))
}

# we get the same with the R function
out_func <- with(sims, BS_fit_rolling(
  S = S, D = D, T. = T, r = r, time = time, method = "iterative",
  grp = month, width = width, min_obs = min_obs))

all.equal(out[, names(out) != "n_iter"],
          out_func[, names(out_func) != "n_iter"])




