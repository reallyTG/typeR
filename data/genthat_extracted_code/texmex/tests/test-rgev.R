context("rgev")

test_that("rgev behaves as it should", {
  skip_on_cran()
  skip_on_travis()
function() {
  ## so, how do we test an RNG...
  num.simple <- 1000
  num.quantile <- 1e6
  
  xi.values  <- c(0, seq(-5, 5, length.out=10))
  test.quantiles <- c(0.25, 0.5, 0.75)
  
  core.sanity.test <- function(xi) {
    seed <- as.integer(runif(1, -1, 1)*(2**30))
    set.seed(seed)
    samples <- rgev(num.simple, 0, 1, xi)
    expect_that(length(samples), equals(num.simple), 
                "rgev: output of correct length")
    if (xi > 0) {
      expect_that(all(samples>=-1/xi), is_true(), "rgev:lowerboundcheck")
    } else if (xi < 0) {
    expect_that(all(samples<=-1/xi), is_true(), "rgev:upperboundcheck")
    }
    ## scale and shift property
    sigma <- rexp(1)
    mu    <- runif(1, -5, 5)
    shifted <- mu + sigma * samples
    set.seed(seed)
    expect_that(shifted, equals(), 
                       rgev(num.simple, mu, sigma, xi),
                       "rgev: scale and shift")
  } # Close core.sanity.test
  
  quantile.test <- function(xi) {
    ## here are the sampled quantiles
    quantiles <- quantile(pgev(rgev(num.quantile, 0, 1, xi),
                               0, 1, xi),
                          probs=test.quantiles,
                          names=FALSE)
    ## this is a bit crude, but hey...
    expect_that(test.quantiles, equals(quantiles), 
                       tolerance=0.02,
                       "rgev: quantile test")
  } # Close quantile.test
  lapply(xi.values, core.sanity.test)
  lapply(xi.values, quantile.test)
}}
)
