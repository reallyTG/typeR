context("dfplapply()")

test_that("dfplapply() performs as expected", {

  # A dataframe
  x <- data.frame(a = 1:20, b = 21:40)

  # A constant
  con <- 12.3

  # A function that operates on a single row of the dataframe
  f <- function(x, const = 1) {
    x$c <- sqrt(x$a + x$b) / const
    return(x)
  }

  # Process the dataframe in parallel
  res1 <- dfplapply(x, f, const = con, njobs = 2, output.df = TRUE, check.interval.sec = 0.2)
  res2 <- dfplapply(x, f, const = con, njobs = 2, output.df = TRUE, random.seed = 12, check.interval.sec = 0.2)  

  # The comparison
  x$c <- sqrt(x$a + x$b) / con

  # Compare
  expect_equal(res1, x)
  expect_equal(res2, x)
    
})
