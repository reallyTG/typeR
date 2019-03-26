context("Miscellaneous tests")

test_that("'parglm' works when package is not attached",{
  # Issue: https://github.com/boennecd/parglm/issues/2#issue-397286510
  # See https://github.com/r-lib/devtools/issues/1797#issuecomment-423288947

  expect_silent(
    local({
      detach("package:parglm", unload = TRUE, force = TRUE)
      parglm::parglm(mpg ~ gear , data = datasets::mtcars)
      library(parglm)
    },
    envir= new.env(parent = environment(glm))))
})

test_that("Using more threads then rows yields a warning", {
  # Issue: https://github.com/boennecd/parglm/issues/3#issue-399052270

  this_df <- data.frame( a = sample( 1:1000000 , 20 ) / 100 , b = 1 )
  expect_warning(
    parglm( a ~ b - 1, data = this_df , nthreads = 64),
    regexp = "Too few observation compared to the number of threads. 2 thread(s) will be used instead of 64.",
    fixed = TRUE)

  # should yield one thread (the number of rows is less than the number required
  # per thread)
  this_df <- data.frame( a = sample( 1:1000000 , 5 ) / 100 , b = 1 )
  expect_warning(
    parglm( a ~ b - 1, data = this_df , nthreads = 64),
    regexp = "Too few observation compared to the number of threads. 1 thread(s) will be used instead of 64.",
    fixed = TRUE)

  expect_silent(parglm( a ~ b - 1, data = this_df , nthreads = 1))
})
