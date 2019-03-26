test_that("uniformGrid works", {
  data = data.frame(
    w = seq(0, 1, length.out = 5),
    x = factor(letters[1:5]),
    y = ordered(1:5),
    z = 1:5,
    r = letters[1:5],
    stringsAsFactors = FALSE)

  n = 3
  expect_warning(tmp <- uniformGrid(data, n))
  expect_that(tmp, is_a("data.frame"))
  expect_that(sapply(data, class), equals(sapply(tmp, class)))
  expect_that(dim(tmp), equals(c(n, 5)))

  tmp = uniformGrid(data$w, n)
  expect_that(tmp, is_a("numeric"))
  expect_that(range(tmp), equals(range(data$w)))
  expect_that(length(tmp), equals(n))

  ## should drop n to be the number of levels
  expect_warning(tmp <- uniformGrid(data$x, n))
  expect_that(tmp, is_a("factor"))
  expect_that(length(uniformGrid(data$x, 6)), equals(5))

  tmp = uniformGrid(data$y, n)
  expect_that(tmp, is_a("ordered"))
  expect_that(range(tmp), equals(range(data$y)))
  expect_that(length(tmp), equals(n))

  tmp = uniformGrid(data$z, n)
  expect_that(tmp, is_a("integer"))
  expect_that(range(tmp), equals(range(data$z)))
  expect_that(length(tmp), equals(n))

  expect_warning(tmp <- uniformGrid(data$r, n))
  expect_that(tmp, is_a("character"))
  expect_that(length(tmp), equals(n))
  expect_that(length(uniformGrid(data$r, 6)), equals(5))
})

test_that("cartesianExpand works", {
  x = data.frame("a" = 1:5, "b" = 6:10)
  y = data.frame("z" = letters[1:5], "y" = letters[6:10])
  tmp = cartesianExpand(x, y)
  expect_that(dim(tmp), equals(c(dim(x)[1] * dim(y)[1], 4)))
})

test_that("makeDesign works", {
  data = data.frame(w = seq(0, 1, length.out = 5),
    x = factor(letters[1:5]),
    y = ordered(1:5),
    z = 1:5,
    r = letters[1:5],
    stringsAsFactors = FALSE)

  ## test normal case
  tmp = makeDesign(data, "w", c(10, 5), TRUE)
  expect_that(dim(tmp), equals(c(10 * 5, dim(data)[2])))
  expect_that(length(unique(tmp[, "w"])), equals(10))
  expect_that(all(!is.na(tmp)), is_true())

  ## test uniformGrid downsizing
  tmp = makeDesign(data, "y", c(10, 5), TRUE)
  expect_that(dim(tmp), equals(c(length(unique(data$y)) * 5, dim(data)[2])))
  expect_that(length(unique(tmp[, "y"])), equals(5))
  expect_that(all(!is.na(tmp)), is_true())

  ## test points arg
  tmp = makeDesign(data, "r", c(NA, 5), points = list("r" = c("a", "b")))
  expect_that(dim(tmp), equals(c(2 * 5, dim(data)[2])))
  expect_that(length(unique(tmp[, "r"])), equals(2))
  expect_that(all(!is.na(tmp)), is_true())

  ## test multivariate case
  tmp = makeDesign(data, c("r", "z"), c(10, 5))
  expect_that(dim(tmp), equals(c(5 * 5 * 5, dim(data)[2])))
  expect_that(length(unique(tmp[, "r"])), equals(5))
  expect_that(length(unique(tmp[, "z"])), equals(5))
  expect_that(all(!is.na(tmp)), is_true())

  ## test int.points arg
  tmp = makeDesign(data, "r", c(5, NA), int.points = 1:3)
  expect_that(nrow(unique(tmp[, !colnames(data) == "r"])), equals(3))
})
