context("equations")

test_that("calc_K", {
  v1 <- junctions::calc_k(R = 10)
  expect_equal(v1, 5)

  v2 <- junctions::calc_k(N = 10)
  expect_equal(v2, 10)

  v3 <- junctions::calc_k()
  A <- is.infinite(v3)
  expect_equal(A, TRUE)
})

test_that("calculate_J and error", {

  maxT <- 200
  J <- junctions::number_of_junctions(N = 100, R = 1000, 
                                      H_0 = 0.5, C = 1, maxT)

  time_estim <- junctions::estimate_time(J = J, N = 100, 
                                         R = 1000, H_0 = 0.5, 
                                         C = 1)
  expect_equal(time_estim, maxT)

  expect_silent(
    junctions::time_error(J = J, N = 100, R = 1000,
                          H_0 = 0.5, C = 1, time_estim,
                          relative = TRUE)
  )

  expect_silent(
    junctions::time_error(J = J, N = 100,
                          R = 1000, H_0 = 0.5,
                          C = 1, time_estim,
                          relative = FALSE)
  )

  expect_silent(
    junctions::calculate_mat(N = 100, R = 1000,
                             H_0 = 0.5, C = 1)
  )

  expect_silent(
    junctions::number_of_junctions(N = Inf, R = Inf,
                                   H_0 = 0.5, C = 1, maxT)
  )

  expect_error(
    junctions::calculate_mat(N = Inf, R = Inf,
                             H_0 = 0.5, C = 1)
  )

  expect_error(
    junctions::estimate_time(J = NA, N = 100,
                             R = 1000, H_0 = 0.5,
                             C = 1)
  )

  expect_error(
    junctions::estimate_time(N = 100, R = 1000,
                             H_0 = 0.5, C = 1)
  )

  expect_silent(
    junctions::estimate_time(J = 100, N = Inf, R = Inf,
                             H_0 = 0.5, C = 1)
  )

})