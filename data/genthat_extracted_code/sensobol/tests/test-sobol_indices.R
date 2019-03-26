context("test-sobol_indices")

test_that("Error when second = FALSE and third = TRUE", {
  N <- 100
  k <- 8
  R <- 10
  A <- sobol_matrices(N, k, second = TRUE, third = TRUE)
  params <- colnames(data.frame(A))
  Y <- sobol_Fun(A)
  expect_error(sobol_indices(Y = Y, params = params, type = "jansen", R = R, n = N, second = FALSE, third = TRUE),
               "The computation of third-order indices requires second = TRUE as it computes second-order indices first")
})

# FOR THE JANSEN ESTIMATOR

test_that("number of rows equals k when second = FALSE & third = FALSE" , {
  N <- 100
  k <- 8
  R <- 10
  A <- sobol_matrices(N, k)
  params <- colnames(data.frame(A))
  Y <- sobol_Fun(A)
  expect_equal(nrow(sobol_indices(Y = Y, params = params, type = "jansen", R = R, n = N)),
              k)
})

test_that("number of rows equals k + (!k / (!2 * !(k - 2))) when second = TRUE & third = FALSE" , {
  N <- 100
  k <- 8
  R <- 10
  A <- sobol_matrices(N, k, second = TRUE)
  params <- colnames(data.frame(A))
  Y <- sobol_Fun(A)
  expect_equal(nrow(sobol_indices(Y = Y, params = params, type = "jansen", R = R, n = N, second = TRUE)),
               k + (factorial(k) / (factorial(2) * factorial(k - 2))))
})

test_that("number of rows equals k + (!k / (!2 * !(k - 2))) +  (!k / (!3 * !(k - 3)))
          when second = TRUE & third = TRUE" , {
  N <- 100
  k <- 8
  R <- 10
  A <- sobol_matrices(N, k, second = TRUE, third = TRUE)
  params <- colnames(data.frame(A))
  Y <- sobol_Fun(A)
  expect_equal(nrow(sobol_indices(Y = Y, params = params, type = "jansen", R = R, n = N, second = TRUE, third = TRUE)),
               k + (factorial(k) / (factorial(2) * factorial(k - 2))) +
                 (factorial(k) / (factorial(3) * factorial(k - 3))))
})

# FOR THE SALTELLI ESTIMATOR

test_that("number of rows equals k + (!k / (!2 * !(k - 2))) +  (!k / (!3 * !(k - 3)))
          when second = TRUE & third = TRUE" , {
            N <- 100
            k <- 8
            R <- 10
            A <- sobol_matrices(N, k, second = TRUE, third = TRUE)
            params <- colnames(data.frame(A))
            Y <- sobol_Fun(A)
            expect_equal(nrow(sobol_indices(Y = Y, params = params, type = "saltelli", R = R, n = N, second = TRUE, third = TRUE)),
                         k + (factorial(k) / (factorial(2) * factorial(k - 2))) +
                           (factorial(k) / (factorial(3) * factorial(k - 3))))
          })


