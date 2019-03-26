## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(comment = "#>", collapse = TRUE)

required <- c("bayesplot", "ggplot2")

if (!all(unlist(lapply(required, function(pkg) requireNamespace(pkg, quietly = TRUE)))))
  knitr::opts_chunk$set(eval = FALSE)

## ------------------------------------------------------------------------
# Set the number of posterior samples required.
n <- 1000
set.seed(47)
library(revdbayes)

## ------------------------------------------------------------------------
### GEV model for Port Pirie Annual Maximum Sea Levels 
data(portpirie)
mat <- diag(c(10000, 10000, 100))
pn <- set_prior(prior = "norm", model = "gev", mean = c(0,0,0), cov = mat)
gevp  <- rpost(n = n, model = "gev", prior = pn, data = portpirie, nrep = 50)

### GP model for Gulf-of-Mexico significant wave heights
data(gom)
u <- quantile(gom, probs = 0.65)
fp <- set_prior(prior = "flat", model = "gp", min_xi = -1)
gpg <- rpost(n = 1000, model = "gp", prior = fp, thresh = u, data = gom, nrep = 50)

## ------------------------------------------------------------------------
library(bayesplot)
library(ggplot2)

## ---- fig.show='hold'----------------------------------------------------
# GEV
pp_check(gevp, type = "overlaid") + ggtitle("GEV empirical distribution functions")
pp_check(gevp, type = "overlaid", subtype = "dens") + ggtitle("GEV kernel density estimates")

## ---- fig.show='hold'----------------------------------------------------
pp_check(gpg, type = "multiple") + ggtitle("GP kernel density estimates")
pp_check(gpg, type = "multiple", subtype = "boxplot") + ggtitle("GP boxplots")

## ---- fig.show='hold'----------------------------------------------------
pp_check(gpg)
pp_check(gpg, stat = "max")
pp_check(gpg, stat = c("min", "max"))
iqr <- function(y) diff(quantile(y, c(0.25, 0.75)))
pp_check(gpg, stat = "iqr")

## ------------------------------------------------------------------------
### Binomial-GP model for Gulf-of-Mexico significant wave heights
data(gom)
u <- quantile(gom, probs = 0.65)
fp <- set_prior(prior = "flat", model = "gp", min_xi = -1)
bp <- set_bin_prior(prior = "jeffreys")
# We need to provide the mean number of observations per year (the data cover a period of 105 years)
npy_gom <- length(gom)/105
bgpg <- rpost(n = 1000, model = "bingp", prior = fp, thresh = u, data = gom,
              bin_prior = bp, npy = npy_gom, nrep = 50)

## ---- fig.show='hold'----------------------------------------------------
# GEV (Portpirie)
plot(predict(gevp, type = "d", n_years = c(100, 1000)), cex = 0.7)
plot(predict(gevp, type = "p", n_years = c(100, 1000)), cex = 0.7)

## ---- fig.show='hold'----------------------------------------------------
# binGP (Gulf-of-Mexico)
plot(predict(bgpg, type = "d", n_years = c(100, 1000)), cex = 0.7)
plot(predict(bgpg, type = "p", n_years = c(100, 1000)), cex = 0.7)

## ----  fig.width = 7-----------------------------------------------------
i_gevp <- predict(gevp, n_years = c(100, 1000), level = c(50, 95, 99), hpd = TRUE)
plot(i_gevp, which_int = "both")
i_bgpp <- predict(bgpg, n_years = c(100, 1000), level = c(50, 95, 99), hpd = TRUE)
plot(i_bgpp, which_int = "both")

