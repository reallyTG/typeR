context("parLapplyW()")

test_that("parLapplyW() returns values that are identical to lapply()", {

  a <- list(a = rnorm(10), b = rnorm(20), c = rnorm(15))
  
  res.1 <- parLapplyW(a, mean, njobs = 2)
  res.2 <- parLapplyW(a, mean, njobs = 1)
  res.3 <- lapply(a, mean)

  expect_equal(res.1, res.3)
  expect_equal(res.2, res.3)
    
})

test_that("parLapplyW() catches errors", {

  d <- list(a1 = rnorm(10), a2 = rnorm(10), a3 = rnorm(10), a4 = rnorm(10))

  # Create a function that should throw an error
  f <- function(x) {
    mean(x) + nonExistentObject
  }

  expect_error(parLapplyW(d, f, njobs = 2), "object 'nonExistentObject' not found")
  
})

test_that("External variables and expressions are passed correctly", {

  # Create a simple list
  a <- list(a = rnorm(10), b = rnorm(20), c = rnorm(15))
  
  # Some objects that will be needed by f1:
  b1 <- rexp(20)
  b2 <- rpois(10, 20)
  
  # The function, which will depend on the Smisc package
  f1 <- function(x, someText = "this.stuff") {
    textJunk <- stripExtension(someText)
    result <- mean(x) + max(b1) - min(b2)
    return(list(textJunk, result))
  }
  
  # Call parLapplyW(), loading the Smisc package and passing in the "b1" and "b2" objects
  res.1 <- parLapplyW(a, f1, someText = "that.stuff", njobs = 2,
                      expr = expression(library(Smisc)),
                      varlist = c("b1", "b2"))
  
  # Call lapply
  res.3 <- lapply(a, f1, someText = "that.stuff")
  
  # Compare results, these should be equivalent
  expect_equal(res.1, res.3)
      
})
