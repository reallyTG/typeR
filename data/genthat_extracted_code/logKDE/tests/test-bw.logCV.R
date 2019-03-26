context("Check bw.logCV")

test_that("Check that bw.logCV yields a numerical value for data sets of different sizes.", {

  # Generate some random data
  SAMPLE50 <- rchisq(50,10)
  SAMPLE100 <- rchisq(100,10)
  SAMPLE200 <- rchisq(200,10)

  # Check that bw.logCV produces a numerical bandwidth from the samples
  expect_equal(is.numeric(bw.logCV(SAMPLE50)), TRUE)
  expect_equal(is.numeric(bw.logCV(SAMPLE100)), TRUE)
  expect_equal(is.numeric(bw.logCV(SAMPLE200)), TRUE)

})

test_that("Check that bw.logCV yields a numerical value for different grid sizes.", {

  # Generate some random data
  SAMPLE100 <- rchisq(100,10)

  # Check that bw.logCV produces a numerical bandwidth from the samples
  expect_equal(is.numeric(bw.logCV(SAMPLE100,grid=6)), TRUE)
  expect_equal(is.numeric(bw.logCV(SAMPLE100,grid=11)), TRUE)
  expect_equal(is.numeric(bw.logCV(SAMPLE100,grid=16)), TRUE)

})

test_that("Check that bw.logCV yields a numerical value for different number of points:", {

  # Generate some random data
  SAMPLE100 <- rchisq(100,10)

  # Check that bw.logCV produces a numerical bandwidth from the samples
  expect_equal(is.numeric(bw.logCV(SAMPLE100,NB=64)), TRUE)
  expect_equal(is.numeric(bw.logCV(SAMPLE100,NB=128)), TRUE)
  expect_equal(is.numeric(bw.logCV(SAMPLE100,NB=256)), TRUE)
  expect_equal(is.numeric(bw.logCV(SAMPLE100,NB=1024)), TRUE)

})

