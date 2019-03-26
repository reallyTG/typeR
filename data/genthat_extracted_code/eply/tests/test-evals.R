context("evals")

test_that("evals() works.", {
  expect_equal(evals(), NULL)
  a1 <- list("x", "y")
  a2 <- unlist(a1)
  x <- y <- -1
  expect_equal(unname(evals(a1)), c(-1, -1))
  tev <- function() {
    x <- y <- 7
    unname(evals(a1))
  }
  expect_equal(tev(), c(7, 7))
  o <- w <- list(x = 1, y = 2)
  expect_equal(evals(a1, w, T), unlist(o))
  expect_equal(evals(a2, w, T), unlist(o))
  expect_equal(evals(a1, w, F), o)
  expect_equal(evals(a2, w, F), o)
  x <- c("1+1", "2+2", "3+3")
  expect_equal(evals(x), c("1+1" = 2, "2+2" = 4, "3+3" = 6))
  e <- new.env()
  e$a <- 1
  e$b <- 2
  x <- c("1+a", "2 - b")
  expect_equal(unname(evals(x, .with = e)), c(2, 0))
  d <- data.frame(a = 3, b = 3)
  expect_equal(unname(evals(x, .with = d)), c(4, -1))
})
