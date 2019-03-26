library(revdbayes)


### Name: predict.evpost
### Title: Predictive inference for the largest value observed in N years.
### Aliases: predict.evpost

### ** Examples

### GEV
data(portpirie)
mat <- diag(c(10000, 10000, 100))
pn <- set_prior(prior = "norm", model = "gev", mean = c(0,0,0), cov = mat)
gevp  <- rpost_rcpp(n = 1000, model = "gev", prior = pn, data = portpirie)

# Interval estimation
predict(gevp)$long
predict(gevp, hpd = TRUE)$short
# Density function
x <- 4:7
predict(gevp, type = "d", x = x)$y
plot(predict(gevp, type = "d", n_years = c(100, 1000)))
# Distribution function
predict(gevp, type = "p", x = x)$y
plot(predict(gevp, type = "p", n_years = c(100, 1000)))
# Quantiles
predict(gevp, type = "q", n_years = c(100, 1000))$y
# Random generation
plot(predict(gevp, type = "r"))

### Binomial-GP
data(gom)
u <- quantile(gom, probs = 0.65)
fp <- set_prior(prior = "flat", model = "gp", min_xi = -1)
bp <- set_bin_prior(prior = "jeffreys")
npy_gom <- length(gom)/105
bgpg <- rpost_rcpp(n = 1000, model = "bingp", prior = fp, thresh = u,
                   data = gom, bin_prior = bp)

# Setting npy in call to predict.evpost()
predict(bgpg, npy = npy_gom)$long

# Setting npy in call to rpost() or rpost_rcpp()
bgpg <- rpost_rcpp(n = 1000, model = "bingp", prior = fp, thresh = u,
                   data = gom, bin_prior = bp, npy = npy_gom)

# Interval estimation
predict(bgpg)$long
predict(bgpg, hpd = TRUE)$short
# Density function
plot(predict(bgpg, type = "d", n_years = c(100, 1000)))
# Distribution function
plot(predict(bgpg, type = "p", n_years = c(100, 1000)))
# Quantiles
predict(bgpg, type = "q", n_years = c(100, 1000))$y
# Random generation
plot(predict(bgpg, type = "r"))



