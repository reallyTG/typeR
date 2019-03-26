library(BMT)


### Name: mpsedist
### Title: Maximum Product of Spacing Fit of Univariate Distributions.
### Aliases: mpsedist
### Keywords: distribution

### ** Examples

# (1) basic fit of a normal distribution 
set.seed(1234)
x1 <- rnorm(n = 100)
mean(x1); sd(x1)
mpse1 <- mpsedist(x1, "norm")
mpse1$estimate

# (2) defining your own distribution functions, here for the Gumbel 
# distribution for other distributions, see the CRAN task view dedicated 
# to probability distributions
dgumbel <- function(x, a, b) 1/b*exp((a-x)/b)*exp(-exp((a-x)/b))
pgumbel <- function(q, a, b) exp(-exp((a-q)/b))
qgumbel <- function(p, a, b) a-b*log(-log(p))
mpse1 <- mpsedist(x1, "gumbel", start = list(a = 10, b = 5))
mpse1$estimate

# (3) fit a discrete distribution (Poisson)
set.seed(1234)
x2 <- rpois(n = 30, lambda = 2)
mpse2 <- mpsedist(x2, "pois")
mpse2$estimate

# (4) fit a finite-support distribution (beta)
set.seed(1234)
x3 <- rbeta(n = 100, shape1 = 5, shape2 = 10)
mpse3 <- mpsedist(x3, "beta")
mpse3$estimate

# (5) fit frequency distributions on USArrests dataset.
x4 <- USArrests$Assault
mpse4pois <- mpsedist(x4, "pois")
mpse4pois$estimate
mpse4nbinom <- mpsedist(x4, "nbinom")
mpse4nbinom$estimate

# (6) weighted fit of a normal distribution 
set.seed(1234)
w1 <- runif(101)
mpse1 <- mpsedist(x1, "norm", weights = w1)
mpse1$estimate




