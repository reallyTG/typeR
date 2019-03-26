context("Check bw.logG")

test_that("Check that bw.logG yields a numerical value.", {

# Generate some random data
  SAMPLE50 <- rchisq(50,10)
  SAMPLE100 <- rchisq(100,10)
  SAMPLE200 <- rchisq(200,10)

  # Check that bw.logG produces a numerical bandwidth from the samples
  expect_equal(is.numeric(bw.logG(SAMPLE50)), TRUE)
  expect_equal(is.numeric(bw.logG(SAMPLE100)), TRUE)
  expect_equal(is.numeric(bw.logG(SAMPLE200)), TRUE)

})

test_that("Check that bw.logG yields correct values according to the mathematical formula.", {

  # Generate some random data
  SAMPLE50 <- rchisq(50,10)
  SAMPLE100 <- rchisq(100,10)
  SAMPLE200 <- rchisq(200,10)

  x <- SAMPLE50
  s<-stats::sd(log(x))
  n<-length(x)
  bw = (8*(exp(0.25*s^2))/(s^4 + 4*s^2 + 12))^(0.2)*(s/(n^0.2))
  CORRECT50 <- bw

  x <- SAMPLE100
  s<-stats::sd(log(x))
  n<-length(x)
  bw = (8*(exp(0.25*s^2))/(s^4 + 4*s^2 + 12))^(0.2)*(s/(n^0.2))
  CORRECT100 <- bw

  x <- SAMPLE200
  s<-stats::sd(log(x))
  n<-length(x)
  bw = (8*(exp(0.25*s^2))/(s^4 + 4*s^2 + 12))^(0.2)*(s/(n^0.2))
  CORRECT200 <- bw

  # Check that bw.logG the correct bandwidth according to the formula from the samples
  expect_equal(bw.logG(SAMPLE50), CORRECT50)
  expect_equal(bw.logG(SAMPLE100), CORRECT100)
  expect_equal(bw.logG(SAMPLE200), CORRECT200)

})

