context('Test PECOK Estimators')

# TEST FORM - test_that("NAME",{  })

test_that("Test Gamma Hat Par vs. Sequential",{
  K <- 5
  d <- 20
  dat <- gforce.generator(K,d,d,3,graph='DeltaC',cov_gap_mult=4)
  gh1 <- gforce.Gamma(dat$X,par=TRUE)
  gh2 <- gforce.Gamma(dat$X,par=FALSE)

  expect_equal(gh1,gh2)
})

test_that("Test Gamma Hat Alternate R vs. Native Code",{
  K <- 5
  d <- 20
  dat <- gforce.generator(K,d,d,3,graph='DeltaC',cov_gap_mult=4)
  gh1 <- gforce.Gamma(dat$X,fast_estimator=TRUE)
  gh2 <- gforce.Gamma(dat$X,fast_estimator=TRUE,R_only=TRUE)

  expect_equal(gh1,gh2)
})

test_that("Test Gamma Hat Alternate Par vs. Sequential",{
  K <- 5
  d <- 20
  dat <- gforce.generator(K,d,d,3,graph='DeltaC',cov_gap_mult=4)
  gh1 <- gforce.Gamma(dat$X,fast_estimator=TRUE)
  gh2 <- gforce.Gamma(dat$X,fast_estimator=TRUE,par=TRUE)

  expect_equal(gh1,gh2)
})