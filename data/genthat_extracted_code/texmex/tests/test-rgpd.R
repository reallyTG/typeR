context("rgpd")

test_that("rgpd behaves as it should", {
  skip_on_cran()
  skip_on_travis()
  ## testing an RNG...
  num.simple <- 1000
  num.quantile <- 1e6
  
  xi.values <- c(0, seq(-2, 2), length.out=10)
  test.quantiles <- c(0.25, 0.5, 0.75)
  
  core.sanity.test <- function(xi) {
    seed <- as.integer(runif(1, -1, 1)*(2**30))
    set.seed(seed)
    samples <- rgpd(num.simple, 1, xi)
    expect_that(length(samples), equals(num.simple), 
                "rgpd: output of correct length")
    if (xi < 0) {
      expect_that(all(samples<=-1/xi), is_true(), "rgpd:upperboundcheck")
    }
    expect_that(all(samples>0), is_true(), "rgpd:lowerboundcheck")
    
    sigma <- rexp(1)
    mu    <- runif(1, -5, 5)
    shifted <- mu + sigma * samples
    set.seed(seed)
    expect_that(shifted, equals(rgpd(num.simple, sigma, xi, u=mu)),
                       "rgpd: scale and shift")
  }
  
  quantile.test <- function(xi) {
    ## here are the sampled quantiles
    quantiles <- quantile(pgpd(rgpd(num.quantile, 1, xi),
                               1, xi),
                          probs=test.quantiles,
                          names=FALSE)
    ## this is a bit crude, but hey...
    expect_that(test.quantiles, equals(quantiles, tolerance=0.02),
                "rgpd: quantile test")
  }

  lapply(xi.values, core.sanity.test)
  lapply(xi.values, quantile.test)
}
)
