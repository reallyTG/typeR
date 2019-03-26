context("hardCode()")

test_that("hardCode() returns messages as expected", {

  expect_output(hardCode(1:5, vname = "a", vert = FALSE), "a <- c(1, 2, 3, 4, 5)", fixed = TRUE)

  expect_output(hardCode(1:2, vname = "new"), "new <- c(1,\n         2)", fixed = TRUE)

  expect_output(hardCode(letters[1:3], vname = "b", vert = FALSE), 'b <- c("a", "b", "c")', fixed = TRUE)

  expect_output(hardCode(c(TRUE, FALSE)), "x <- c(TRUE,\n       FALSE)", fixed = TRUE)

  expect_output(hardCode(c(4 + 3i, 2 - 2i), vert = FALSE), "x <- c(4+3i, 2-2i)", fixed = TRUE)

  expect_output(hardCode(c("4", "NA", "3"), vert = FALSE), 'x <- c("4", "NA", "3")', fixed = TRUE)

  expect_output(hardCode(c("4", NA, "3"), vert = FALSE), 'x <- c("4", NA, "3")', fixed = TRUE)
  
  expect_output(hardCode(c(4, NA, 33), vert = FALSE), "x <- c(4, NA, 33)", fixed = TRUE)
  
  expect_output(hardCode(c(TRUE, NA, FALSE), vert = FALSE), 'x <- c(TRUE, NA, FALSE)', fixed = TRUE)
  
  expect_output(hardCode(c(4+3i, NA, 2-12i), vert = FALSE), 'x <- c(4+3i, NA, 2-12i)', fixed = TRUE)

  expect_output(hardCode(as.character(rep(NA, 2))), "x <- c(NA,\n       NA)", fixed = TRUE)

  expect_output(hardCode(rep("NA", 2)), 'x <- c("NA",\n       "NA")', fixed = TRUE)

  expect_output(hardCode(c("NA", NA), vert = FALSE), 'x <- c("NA", NA)', fixed = TRUE)

  expect_output(hardCode(7, vert = FALSE), "x <- 7", fixed = TRUE)
  
  expect_output(hardCode("this", vert = FALSE), 'x <- "this"', fixed = TRUE)
  
  expect_output(hardCode("this"), 'x <- "this"', fixed = TRUE)
  
  expect_output(hardCode(as.character(NA), vert = FALSE), "x <- NA", fixed = TRUE)
  
  expect_output(hardCode(as.character(NA)), "x <- NA", fixed = TRUE)

  expect_output(hardCode(FALSE), "x <- FALSE", fixed = TRUE)
  
})

test_that("hardCode() returns errors as expected", {

  expect_error(hardCode(list(x = rnorm(3))), "'x' must be a numeric, character")
  
  expect_error(hardCode(1:2, vname = 7), "'vname' must be a character string")

  expect_error(hardCode("a", vert = "this"), "'vert' must be TRUE or FALSE")
                        
})
