library(babar)


### Name: nestedSampling
### Title: nestedSampling
### Aliases: nestedSampling

### ** Examples


mu <- 1
sigma <- 1
data <- rnorm(100, mu, sigma)

transform <- function(params) {
  tParams = numeric(length=length(params))
  tParams[1] = GaussianPrior(params[1], mu, sigma)
  tParams[2] = UniformPrior(params[2], 0, 2 * sigma)
  return(tParams)
}

llf <- function(params) {
  tParams = transform(params)
  mean = tParams[1]
  sigma = tParams[2]
  n <- length(data)
  ll <- -(n/2) * log(2*pi) - (n/2) * log(sigma**2) - (1/(2*sigma**2)) * sum((data-mean)**2)
  return(ll)
}

prior.size <- 25
tol <- 0.5

ns.results <- nestedSampling(llf, 2, prior.size, transform, tolerance=tol)




