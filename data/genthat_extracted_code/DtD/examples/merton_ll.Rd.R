library(DtD)


### Name: merton_ll
### Title: Compute Log-Likelihood of Merton Model
### Aliases: merton_ll

### ** Examples

# we get the same if we call `optim` as follows. The former is faster and is
# recommended
set.seed(4648394)
sims <- BS_sim(
  vol = .1, mu = .05, dt = .1, V_0 = 100, T. = 1, D = rep(80, 20), r = .01)

r1 <- with(
  sims, BS_fit(S = S, D = D, T. = T, r = r, time = time, method = "mle",
               eps = 1e-8, vol_start = .2))

r2 <- optim(c(mu = 0, log_vol = log(.2)), function(par)
  -with(
    sims, merton_ll(S = S, D = D, T. = T, r = r, time = time,
                    mu = par["mu"], vol = exp(par["log_vol"]))))

all.equal(r1$n_iter, unname(r2$counts[1]))
all.equal(r1$ests[1], r2$par[1])
all.equal(r1$ests[2], exp(r2$par[2]), check.attributes = FALSE)

# the log-likelihood integrates to one as it should though likely not the
# most stable way to test this
ll <- integrate(
  function(x) sapply(x, function(S)
    exp(merton_ll(
      S = c(1, S), D = .8, T. = 3, r = .01, dt = 1/250, vol = .2,
      mu = .05))),
  lower = 1e-4, upper = 6)
stopifnot(isTRUE(all.equal(ll$value, 1, tolerance = 1e-5)))




