library(eva)


### Name: gevrFit
### Title: Parameter estimation for the GEVr distribution model
### Aliases: gevrFit

### ** Examples

set.seed(7)
x1 <- rgevr(500, 1, loc = 0.5, scale = 1, shape = 0.3)
result1 <- gevrFit(x1, method = "mps")

## A linear trend in the location and scale parameter
n <- 100
r <- 10
x2 <- rgevr(n, r, loc = 100 + 1:n / 50,  scale = 1 + 1:n / 300, shape = 0)

covs <- as.data.frame(seq(1, n, 1))
names(covs) <- c("Trend1")
## Create some unrelated covariates
covs$Trend2 <- rnorm(n)
covs$Trend3 <- 30 * runif(n)
result2 <- gevrFit(data = x2, method = "mle", locvars = covs, locform = ~ Trend1 + Trend2*Trend3,
scalevars = covs, scaleform = ~ Trend1)

## Show summary of estimates
result2




