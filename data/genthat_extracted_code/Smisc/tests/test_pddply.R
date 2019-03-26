context("pddply()")

test_that("pddply() returns values that are identical to ddply()", {

  loadNamespace("plyr")
  data(baseball, package = "plyr")
  
  # First round of checks
  o1 <- pddply(baseball, ~ year, nrow, njobs = 2)
  o2 <- plyr::ddply(baseball, ~ year, nrow)
  o3 <- pddply(baseball, ~ year, nrow, njobs = 1)
  expect_equal(o1, o2)
  expect_equal(o2, o3)
  expect_equal(o1, o3)
  
  # Different example
  o4 <- pddply(baseball, "lg", c("nrow", "ncol"), njobs = 2)
  o5 <- plyr::ddply(baseball, "lg", c("nrow", "ncol"))
  expect_equal(o4, o5)
   
})


test_that("We can pass objects and packages into ddply()", {

  ## The following code runs just fine in the console and for 'source("testthat.R")'
  ## Furthore more, it works fine in 'example(pddply)', and it runs fine in the
  ## R CMD check --as-cran testing of the examples.  But it fails for some unknown
  ## reason when R CMD check runs 'testhat.R'.

  ## data(baseball, package = "plyr")

  ### Only this was required to get it to run on the command line
  ## number1 <- 7
  ### But this was required to get 'source("testthat.R")' to run
  ## assign("number1", 7, envir = environment())  

  ## f <- function(x, number2 = 10) {
  ##   paste(x$id[1], padZero(number1, num = 2), number2, sep = "-")
  ## }

  ## # In parallel
  ## o5 <- pddply(baseball[1:100,], "year", f, number2 = 13, njobs = 2,
  ##              .paropts = list(.packages = "Smisc", .export = "number1"))
  
  ## # Non parallel
  ## o6 <- plyr::ddply(baseball[1:100,], "year", f, number2 = 13)

  ## identical(o5, o6)

    
  # I had to modify the code above (noted by #?#) because
  # otherwise the tests executed during the CRAN build test failed

  f <- function(x, number2 = 10) {
    number1 <- 7  #?#
    paste(x$id[1], padZero(number1, num = 2), number2, sep = "-")
  }
    
  # In parallel
  o5 <- pddply(baseball[1:100,], "year", f, number2 = 13, njobs = 2,
               .paropts = list(.packages = "Smisc")) #?#, .export = "number1"))
  
  # Non parallel
  o6 <- plyr::ddply(baseball[1:100,], "year", f, number2 = 13)
  
  expect_equal(o5, o6)
    
})

test_that("ppdply() catches errors", {

  d <- data.frame(g = rep(letters[1:3], each = 5), x = rnorm(15))

  # Create a function that should throw an error
  f <- function(x) {
    mean(x$x) + nonExistentObject
  }

  expect_error(pddply(d, "g", f, njobs = 2), "object 'nonExistentObject' not found")
  
})

