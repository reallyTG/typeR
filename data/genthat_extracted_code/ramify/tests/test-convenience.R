context("Convenience functions")

test_that("convenience functions work as expected", {
  
  # argmax/argmin
  a <- resize(0:5, 2, 3)
  expect_identical(argmax(a), c(3L, 3L))
  expect_identical(argmax(a, rows = FALSE), c(2L, 2L, 2L))
  expect_identical(argmin(a), c(1L, 1L))
  expect_identical(argmin(a, rows = FALSE), c(1L, 1L, 1L))
  
  # atleast_2d
  expect_identical(dim(atleast_2d(1:5)), c(5L, 1L))
  expect_identical(dim(atleast_2d(a)), c(2L, 3L))

  # clip
  x <- 1:9
  expect_identical(clip(x, 3, 7), c(3, 3, 3, 4, 5, 6, 7, 7, 7))
  expect_identical(clip(matrix(x, nrow = 3, ncol = 3), 3, 7), cbind(3, 4:6, 7))

  # eye
  d <- eye(3, 3)
  expect_identical(d, diag(1L, 3, 3))
  expect_equal(d, inv(d))  # inverse of identity is identity  # FIXME: Why not identiacal anymore?
  
  # fill rand, randi, randn
  expect_equal(dim(fill(0L, 10)), c(10, 1))
  expect_null(dim(fill(0L, 10, atleast_2d = FALSE)))
  expect_equal(dim(fill(0L, 2, 2, 2)), c(2, 2, 2))

  
  # falses, trues, ones, and zeros
  expect_identical(falses(10), atleast_2d(rep(FALSE, 10)))
  expect_identical(trues(10), atleast_2d(rep(TRUE, 10)))
  expect_identical(trues(10), !atleast_2d(rep(FALSE, 10)))
  expect_identical(trues(10), atleast_2d(!rep(FALSE, 10)))
  expect_identical(trues(10), atleast_2d(rep(!FALSE, 10)))
  expect_identical(ones(10), atleast_2d(rep(1L, 10)))
  expect_identical(zeros(10), atleast_2d(rep(0L, 10)))

  # flatten
  m1 <- matrix(1:9, 3, 3, byrow = TRUE)
  m2 <- matrix(1:9, 3, 3, byrow = FALSE)
  expect_identical(flatten(m1), 1:9)
  expect_identical(flatten(m1), flatten(m2, across = "columns"))
  expect_identical(flatten(m2), as.integer(c(1, 4, 7, 2, 5, 8, 3, 6, 9)))
  
  # inv, tr
  expect_error(inv(fill(3L, 2, 2)))  # singular matrix
  expect_error(inv(randn(3, 2)))  # non-square matrix
  expect_error(inv(as.data.frame(randn(s, 2))))  # data frame
  expect_identical(inv(2 * eye(3, 3)), 0.5 * eye(3, 3))
  expect_identical(tr(5 * eye(3, 4)), 15)
  expect_identical(tr(diag(8)), 8)
  
  # hcat, vcat
  m1 <- randn(2, 3)
  m2 <- randn(2, 3)
  expect_identical(hcat(m1, m2), cbind(m1, m2))
  expect_identical(vcat(m1, m2), rbind(m1, m2))
  
  # linspace, logspace
  x <- linspace(1, 10, 20)
  y <- logspace(1, 10, 20)
  expect_identical(x, seq(from = 1, to = 10, length.out = 20))
  expect_identical(y, 10^x)
  
  # meshgrid
  x <- linspace(0, 1, 3)
  y <- linspace(0, 1, 2)
  expect_identical(meshgrid(x, y), list(mat("0, 0.5, 1; 0, 0.5, 1"),
                                        mat("0, 0,   0; 1, 1,   1")))
  x <- y <- seq(-5, 5, by = 0.1)
  mg <- meshgrid(x, y)
  z1 <- sin(mg[[1]]^2 + mg[[2]]^2) / (mg[[1]]^2 + mg[[2]]^2)
  z2 <- outer(x, y, function(x, y) sin(x^2 + y^2) / (x^2 + y^2))
  expect_identical(z1, z2)
  
  # rand, randi, and randn
  expect_equal(dim(rand(2, 2, 2)), c(2, 2, 2))
  expect_equal(dim(randi(imax = 100, 2, 2, 2)),c(2, 2, 2))
  expect_equal(dim(randn(2, 2, 2)), c(2, 2, 2))
  expect_null(dim(randn(10, atleast_2d = FALSE)))
  expect_null(dim(rand(10, atleast_2d = FALSE)))
  expect_null(dim(randi(imax = 100, 10, atleast_2d = FALSE)))
  expect_equal(dim(randn(10)), c(10, 1))
  expect_equal(dim(rand(10)), c(10, 1))
  expect_equal(dim(randi(imax = 100, 10)), c(10, 1))
  expect_error(randi(imax = -100, 10))
  
  # repmat
  m1 <- mat("1, 2; 3, 4")
  m2 <- mat("1, 2, 1, 2; 3, 4, 3, 4; 1, 2, 1, 2; 3, 4, 3, 4")
  expect_identical(repmat(m1, 2, 2), m2)
  
  # resize, size
  
  # tri, tril, triu, is.tril, is.triu
  m <- mat("1, 2, 3; 4, 5, 6; 7, 8, 9")
  mu <- mat("1, 2, 3; 0, 5, 6; 0, 0, 9")
  mu2 <- mat("0, 2, 3; 0, 0, 6; 0, 0, 0")
  ml <- mat("1, 0, 0; 4, 5, 0; 7, 8, 9")
  ml2 <- mat("0, 0, 0; 4, 0, 0; 7, 8, 0")
  expect_identical(triu(m, diag = TRUE), mu)
  expect_identical(triu(m, diag = FALSE), mu2)
  expect_identical(tril(m, diag = TRUE), ml)
  expect_identical(tril(m, diag = FALSE), ml2)
  expect_true(is.triu(mu))
  expect_true(is.triu(mu2))
  expect_true(is.tril(ml))
  expect_true(is.tril(ml2))
  
  # Resize a vector into an array
  x <- 1:8
  a <- resize(1:8, 2, 2, 2)
  expect_is(a, "array")
  expect_identical(flatten(a), x)
  

  # Meshgrid (identical)
  x <- y <- seq(-5, 5, by = 0.1)
  mg <- meshgrid(x, y)
  z1 <- sin(mg[[1]]^2 + mg[[2]]^2) / (mg[[1]]^2 + mg[[2]]^2)
  z2 <- outer(x, y, function(x, y) sin(x^2 + y^2) / (x^2 + y^2))
  expect_identical(z1, z2)
  
  # Triangular matrices
  m1 <- mat("1, 1, 1, 0, 0; 
             1, 1, 1, 1, 0; 
             1, 1, 1, 1, 1")
  m2 <- mat("0, 0, 0, 0, 0; 
             1, 0, 0, 0, 0; 
             1, 1, 0, 0, 0")
  expect_equal(tri(3, 5, k = 2), m1, check.attributes = FALSE)
  expect_equal(tri(3, 5, k = -1), m2, check.attributes = FALSE)                     
  expect_equal(tri(3, 5, diag = FALSE), m2, check.attributes = FALSE)
  
  m3 <- matrix(1:12, nrow = 4, ncol = 3, byrow = TRUE)
  m4 <- mat(" 0,  0,  0; 
              4,  0,  0; 
              7,  8,  0; 
             10, 11, 12")
  expect_that(tril(m3, k = -1), equals(m4, check.attributes = FALSE))
  
})
