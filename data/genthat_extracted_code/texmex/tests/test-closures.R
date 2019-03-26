context("closures")

test_that("closures behaves as it should", {
  make.mvn.prior <- .make.mvn.prior
  make.quad.prior <- .make.quadratic.penalty
  make.spd.matrix <- .random.spd.matrix
  for (count in 1:100) {
    dimn <- sample(10, size=1)
    cov.matrix <- make.spd.matrix(dimn)
    centre <- rexp(dimn)
    mvnprior <- make.mvn.prior(list(centre, cov.matrix))
    point <- rexp(dimn)
    expect_that(mvnprior(point),
                equals(dmvnorm(point, centre, cov.matrix, log=TRUE)),
                label="efficient.closures: multivariate Gaussian prior")
    quadprior <- make.quad.prior(list(centre, cov.matrix))
    expect_that(quadprior(point),
                equals(mahalanobis(point, centre, cov.matrix)),
                label="efficient.closures: Mahalanobis distance")
    # or "A-norm", as it's otherwise called
  }
}
)
