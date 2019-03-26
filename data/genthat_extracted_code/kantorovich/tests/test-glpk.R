context("GLPK")

test_that("kantorovich_glpk default distance", {
  mu <- c(1/7,2/7,4/7)
  nu <- c(1/4,1/4,1/2)
  x <- kantorovich_glpk(mu, nu)
  expect_equal(x, 0.107142857142857)
})

test_that("kantorovich_glpk - specified distance", {
  mu <- c(1/4, 3/4, 0, 0)
  nu <- c(0, 1/2, 1/2, 0)
  dist <- structure(c(0, 1/3, 2/3, 1, 1/3, 0, 1/3, 2/3,
                      2/3, 1/3, 0, 1/3, 1, 2/3, 1/3, 0), .Dim = c(4L, 4L))
  # doit trouver 1/4 et deux solutions
  x <- kantorovich_glpk(mu, nu, dist=dist)
  expect_equal(x, 1/4)
  x <- kantorovich_glpk(mu, nu, dist=dist, solution = TRUE)
  sols <- list(structure(c(0, 0, 0, 0, 0.25, 0.25, 0, 0, 0, 0.5, 0, 0, 0, 0, 0, 0),
                         .Dim = c(4L, 4L),
                         .Dimnames = list(c("1", "2", "3", "4"), c("1", "2", "3", "4"))),
               structure(c(0, 0, 0, 0, 0, 0.5, 0, 0, 0.25, 0.25, 0, 0, 0, 0, 0, 0), .Dim = c(4L, 4L),
                         .Dimnames = list(c("1", "2", "3", "4"), c("1", "2", "3", "4"))))
  expect_true(all(abs(attr(x, "solution") - sols[[1]]) <= 1e-15) | all(abs(attr(x, "solution") - sols[[2]]) <= 1e-15))
})

test_that("kantorovich_glpk - nonsymmetric dist", {
  mu <- c(1,2,4)/7
  nu <- c(3,1,5)/9
  D <- matrix(
    c(
      c(0, 1, 3),
      c(1, 0, 4),
      c(2, 4, 0)
    ),
    byrow = TRUE, nrow = 3)
  x <- kantorovich_glpk(mu, nu, dist=D)
  expect_equal(x, 13/63)
  x1 <- kantorovich_glpk(mu, nu, dist=D, solution=TRUE)
  x2 <- kantorovich(mu, nu, dist=D, details=TRUE)
  expect_true(all.equal(attr(x1, "solution"), attr(x2, "joinings")[[1]], tolerance=1e-15, check.attributes=FALSE))
})
