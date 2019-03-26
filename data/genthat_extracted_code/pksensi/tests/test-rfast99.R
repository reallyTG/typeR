context("test-rfast99.R")

test_that("rfast99 single_time", {

  FFPK <- pksensi::FFPK

  q = "qunif"
  q.arg = list(list(min = 0.5, max = 1),
               list(min = 0.5, max = 1.5),
               list(min = 0.02, max = 0.3),
               list(min = 20, max = 60))

  set.seed(1234)
  x<-rfast99(params=c("F","KA","KE","V"), n = 100, q = q, q.arg = q.arg,
             rep = 20, conf = 0.95)
  time <- 0.5
  y<-solve_fun(x, model = FFPK, time = time, vars = "output")
  tell2(x,y)
  check(x)
  print(x)

  expect_equal(dimnames(y)[[3]], "0.5")
  expect_equal(dim(y)[3], 1)
})

test_that("rfast99 class", {

  FFPK <- pksensi::FFPK

  q = "qunif"
  q.arg = list(list(min = 0.5, max = 1),
               list(min = 0.5, max = 1.5),
               list(min = 0.02, max = 0.3),
               list(min = 20, max = 60))

  set.seed(1234)
  x<-rfast99(params=c("F","KA","KE","V"), n = 100, q = q, q.arg = q.arg,
             rep = 20, conf = 0.95)

  time <- seq(from = 0.25, to = 12.25, by = 0.5)
  y<-solve_fun(x, model = FFPK, time = time, vars = "output")
  tell2(x,y)
  check(x)
  print(x)

  heat_check(x, text = T)
  heat_check(x, level = F)
  heat_check(x, index = "CI")

  expect_silent(pksim(y, log = T))
  expect_silent(plot(x))
  expect_that(x, is_a("rfast99"))
  expect_equal(x$M, 4)
  expect_equal(x$replicate, 20)
  expect_equal(x$conf, 0.95)
  expect_true(class(x$a) == "array")
  expect_true(class(x$omega) == "numeric")
})

test_that("rfast99 error", {
  expect_error(rfast99(params = 20, n = 100, q.arg = list(min = 0, max = 1)),
               "Please assign the distribution(s) of quantile function", fix = TRUE)
  expect_error(rfast99(params = 20, n = 100, q = "qunif"),
               "Please assign the arguments for defined distribution", fix = TRUE)
})

test_that("rfast99 factor", {
  params <- c("A","B","C")
  output <- rfast99(params = params, n = 100, q = "qunif", q.arg = list(min = 0, max = 1))
  expect_true(class(output$params) == "character")
})

test_that("rfast99 M", {
  output <- rfast99(params = 3, n = 100, M = 1, q = "qunif", q.arg = list(min = 0, max = 1))
  expect_equal(output$M, 1)
})

test_that("rfast99 rep1", {

  FFPK <- pksensi::FFPK

  q = "qunif"
  q.arg = list(list(min = 0.5, max = 1),
               list(min = 0.5, max = 1.5),
               list(min = 0.02, max = 0.3),
               list(min = 20, max = 60))

  set.seed(1234)
  x<-rfast99(params=c("F","KA","KE","V"), n = 100, q = q, q.arg = q.arg,
             rep = 20, conf = 0.95)

  time <- 0.5
  y<-solve_fun(x, model = FFPK, time = time, vars = "output")
  tell2(x,y)
  check(x)
  print(x)

  expect_equal(x$replicate, 20)
})

test_that("rfast99 rep2", {

  FFPK <- pksensi::FFPK

  q = "qunif"
  q.arg = list(list(min = 0.5, max = 1),
               list(min = 0.5, max = 1.5),
               list(min = 0.02, max = 0.3),
               list(min = 20, max = 60))

  set.seed(1234)
  x<-rfast99(params=c("F","KA","KE","V"), n = 100, q = q, q.arg = q.arg,
             rep = 20, conf = 0.95)

  time <- c(0.5, 1)
  y<-solve_fun(x, model = FFPK, time = time, vars = "output", lnparam = T)
  tell2(x,y)
  check(x, time = 1)
  print(x)

  expect_equal(x$replicate, 20)
})

