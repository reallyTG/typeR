library(BMT)


### Name: mqdedist
### Title: Minimum Quantile Distance Fit of Univariate Distributions.
### Aliases: mqdedist
### Keywords: distribution

### ** Examples

# (1) basic fit of a normal distribution 
set.seed(1234)
x1 <- rnorm(n = 100)
mean(x1); sd(x1)
mqde1 <- mqdedist(x1, "norm")
mqde1$estimate

# (2) defining your own distribution functions, here for the Gumbel 
# distribution for other distributions, see the CRAN task view dedicated 
# to probability distributions
dgumbel <- function(x, a, b) 1/b*exp((a-x)/b)*exp(-exp((a-x)/b))
pgumbel <- function(q, a, b) exp(-exp((a-q)/b))
qgumbel <- function(p, a, b) a-b*log(-log(p))
mqde1 <- mqdedist(x1, "gumbel", start = list(a = 10, b = 5))
mqde1$estimate

# (3) fit a discrete distribution (Poisson)
set.seed(1234)
x2 <- rpois(n = 30, lambda = 2)
mqde2 <- mqdedist(x2, "pois")
mqde2$estimate

# (4) fit a finite-support distribution (beta)
set.seed(1234)
x3 <- rbeta(n = 100, shape1 = 5, shape2 = 10)
mqde3 <- mqdedist(x3, "beta")
mqde3$estimate

# (5) fit frequency distributions on USArrests dataset.
x4 <- USArrests$Assault
mqde4pois <- mqdedist(x4, "pois")
mqde4pois$estimate
mqde4nbinom <- mqdedist(x4, "nbinom")
mqde4nbinom$estimate

# (6) weighted fit of a normal distribution 
set.seed(1234)
w1 <- runif(100)
weighted.mean(x1, w1)
mqde1 <- mqdedist(x1, "norm", weights = w1)
mqde1$estimate




