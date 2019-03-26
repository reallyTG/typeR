library(testthat)
library(retrodesign)

context("make sure that the simulation based method stays
        close to the closed form solution")

# The default reccomendation for n.sims
test_that("Error is less than .5 for 10,000 sims", {
  skip_on_cran()
  typeM_sim <- vector(length = 1000)
  for (x in 1:1000) {
         typeM_sim[x] <- unlist(type_m(.5,1, n.sims = 10000))
  }

  typeM_exact <- rep(retro_design(.5,1)$typeM,1000)

  expect_equal(typeM_sim,typeM_exact, tolerance = .5)

})

# 100,000 sims is a good reccomendation when you need precise estimates of
# type M error
test_that("Error is less than .05 for 100,000 sims", {
  skip_on_cran()
  typeM_sim <- vector(length = 1000)
  for (x in 1:1000) {
    typeM_sim[x] <- unlist(type_m(.5,1, n.sims = 100000))
  }

  typeM_exact <- rep(retro_design(.5,1)$typeM,1000)

  expect_equal(typeM_sim,typeM_exact, tolerance = .05)

})

# Since there is no closed form solution for t-distribution, make sure
# range of estimates isn't too large
test_that("range is less than .1 for 100,000 sims from t-dist", {
  skip_on_cran()
  typeM_sim <- vector(length = 1000)
  for (x in 1:1000) {
    typeM_sim[x] <- unlist(type_m(.5,1, n.sims = 100000, df=10))
  }

  expect_equal(range(typeM_sim)[1],range(typeM_sim)[2], tolerance = .1)

})
