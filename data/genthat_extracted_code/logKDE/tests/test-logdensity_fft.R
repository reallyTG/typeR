context("Check logdensity_fft")

test_that("Check that the default settings of logdensity_fft generates a 'density' object for different sample sizes.", {

  # Generate some random data
  SAMPLE100 <- rchisq(100,10)
  SAMPLE1000 <- rchisq(1000,10)
  SAMPLE10000 <- rchisq(10000,10)

  # Check that logdensity_fft produces a 'density' object from the samples
  expect_is(logdensity_fft(SAMPLE100), 'density')
  expect_is(logdensity_fft(SAMPLE1000), 'density')
  expect_is(logdensity_fft(SAMPLE10000), 'density')

})

test_that("Check that different kernel inputs for logdensity_fft generates a 'density' object.", {

  # Generate some random data
  SAMPLE100 <- rchisq(100,10)

  # Check that logdensity_fft produces a 'density' object for the kernel
  expect_is(logdensity_fft(SAMPLE100,kernel = 'epanechnikov'), 'density')
  expect_is(logdensity_fft(SAMPLE100,kernel = 'triangular'), 'density')
  expect_is(logdensity_fft(SAMPLE100,kernel = 'uniform'), 'density')
  expect_is(logdensity_fft(SAMPLE100,kernel = 'laplace'), 'density')
  expect_is(logdensity_fft(SAMPLE100,kernel = 'logistic'), 'density')

})

test_that("Check that different bandwidth inputs for logdensity_fft generates a 'density' object.", {

  # Generate some random data
  SAMPLE100 <- rchisq(100,10)

  # Check that logdensity_fft produces a 'density' object for the bw setting
  expect_is(logdensity_fft(SAMPLE100,bw='logcv'), 'density')
  expect_is(logdensity_fft(SAMPLE100,bw='logg'), 'density')
  expect_is(logdensity_fft(SAMPLE100,bw='nrd'), 'density')
  expect_is(logdensity_fft(SAMPLE100,bw='ucv'), 'density')
  expect_is(logdensity_fft(SAMPLE100,bw='SJ-ste'), 'density')
  expect_is(logdensity_fft(SAMPLE100,bw='SJ-dpi'), 'density')

})

test_that("Check that different values of n for logdensity_fft generates a 'density' object.", {

  # Generate some random data
  SAMPLE100 <- rchisq(100,10)

  # Check that logdensity_fft produces a 'density' object for the n setting
  expect_is(logdensity_fft(SAMPLE100,n=64), 'density')
  expect_is(logdensity_fft(SAMPLE100,n=128), 'density')
  expect_is(logdensity_fft(SAMPLE100,n=256), 'density')
  expect_is(logdensity_fft(SAMPLE100,n=1028), 'density')

})

test_that("Check that different values of adjust for logdensity_fft generates a 'density' object.", {

  # Generate some random data
  SAMPLE100 <- rchisq(100,10)

  # Check that logdensity_fft produces a 'density' object for the adjust setting
  expect_is(logdensity_fft(SAMPLE100,adjust=0.5), 'density')
  expect_is(logdensity_fft(SAMPLE100,adjust=1.5), 'density')
  expect_is(logdensity_fft(SAMPLE100,adjust=2), 'density')
  expect_is(logdensity_fft(SAMPLE100,adjust=0.25), 'density')

})

test_that("Check that different values of from and to for logdensity_fft generates a 'density' object.", {

  # Generate some random data
  SAMPLE100 <- rchisq(100,10)

  # Check that logdensity_fft produces a 'density' object for the from and to setting
  expect_is(logdensity_fft(SAMPLE100,from=1e-6,to=1), 'density')
  expect_is(logdensity_fft(SAMPLE100,from=1e-6,to=100), 'density')
  expect_is(logdensity_fft(SAMPLE100,from=100,to=200), 'density')
  expect_is(logdensity_fft(SAMPLE100,from=10,to=10), 'density')

})

test_that("Check that different values of cut for logdensity_fft generates a 'density' object.", {

  # Generate some random data
  SAMPLE100 <- rchisq(100,10)

  # Check that logdensity_fft produces a 'density' object from the samples
  expect_is(logdensity_fft(SAMPLE100,cut=1), 'density')
  expect_is(logdensity_fft(SAMPLE100,cut=2), 'density')
  expect_is(logdensity_fft(SAMPLE100,cut=10), 'density')

})
