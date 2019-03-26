test_that("str_length is number of characters", {
  loop.data = list(scope.theo=c(1, 6, 2, 6), scope.area=20)

  test1 <- TRUE
  test2 <- TRUE
  test3 <- TRUE
  test4 <- TRUE

  # Upper left upper corner
  if (test1) {
    loop.data$flip.x <- FALSE
    loop.data$flip.y <- FALSE

    expect_equal(p_ceiling(loop.data, 1,    8), NaN)
    expect_equal(p_ceiling(loop.data, 0,    8), NaN)
    expect_equal(p_ceiling(loop.data, -2/3, 8), NaN)
    expect_equal(p_ceiling(loop.data, -4/3, 8), NaN)

    expect_equal(p_ceiling(loop.data, 2/3,  4), 4/3)
    expect_equal(p_ceiling(loop.data, 0,    3), 15)
    expect_equal(p_ceiling(loop.data, 0,    5), 5)
    expect_equal(p_ceiling(loop.data, -2/3, 4), NaN)

    expect_equal(p_ceiling(loop.data, 4/3,  0), 8)
    expect_equal(p_ceiling(loop.data, 2/3,  0), 17)
    expect_equal(p_ceiling(loop.data, 0,    0), 20)
    expect_equal(p_ceiling(loop.data, -1,   0), NaN)
  }

  # Upper right corner
  if (test2) {
    loop.data$flip.x <- TRUE
    loop.data$flip.y <- FALSE

    expect_equal(p_ceiling(loop.data, 1,    8), NaN)
    expect_equal(p_ceiling(loop.data, 0,    8), NaN)
    expect_equal(p_ceiling(loop.data, -2/3, 8), 3)
    expect_equal(p_ceiling(loop.data, -4/3, 8), 12)

    expect_equal(p_ceiling(loop.data, 2/3,  4), NaN)
    expect_equal(p_ceiling(loop.data, 0,    3), 15)
    expect_equal(p_ceiling(loop.data, 0,    5), 5)
    expect_equal(p_ceiling(loop.data, -2/3, 4), 56/3)

    expect_equal(p_ceiling(loop.data, 4/3,  0), NaN)
    expect_equal(p_ceiling(loop.data, 2/3,  0), NaN)
    expect_equal(p_ceiling(loop.data, 0,    0), 20)
    expect_equal(p_ceiling(loop.data, -1,   0), 20)
  }

  # Lower right corner
  if (test3) {
    loop.data$flip.x <- TRUE
    loop.data$flip.y <- TRUE

    expect_equal(p_ceiling(loop.data, 1,    8), 20)
    expect_equal(p_ceiling(loop.data, 0,    8), 20)
    expect_equal(p_ceiling(loop.data, -2/3, 8), NaN)
    expect_equal(p_ceiling(loop.data, -4/3, 8), NaN)

    expect_equal(p_ceiling(loop.data, 2/3,  4), 56/3)
    expect_equal(p_ceiling(loop.data, 0,    3), 5)
    expect_equal(p_ceiling(loop.data, 0,    5), 15)
    expect_equal(p_ceiling(loop.data, -2/3, 4), NaN)

    expect_equal(p_ceiling(loop.data, 4/3,  0), 12)
    expect_equal(p_ceiling(loop.data, 2/3,  0), 3)
    expect_equal(p_ceiling(loop.data, 0,    0), NaN)
    expect_equal(p_ceiling(loop.data, -1,   0), NaN)
  }

  # Lower left corner
  if (test4) {
    loop.data$flip.x <- FALSE
    loop.data$flip.y <- TRUE

    expect_equal(p_ceiling(loop.data, 1,    8), NaN)
    expect_equal(p_ceiling(loop.data, 0,    8), 20)
    expect_equal(p_ceiling(loop.data, -2/3, 8), 17)
    expect_equal(p_ceiling(loop.data, -4/3, 8), 8)

    expect_equal(p_ceiling(loop.data, 2/3,  4), NaN)
    expect_equal(p_ceiling(loop.data, 0,    3), 5)
    expect_equal(p_ceiling(loop.data, 0,    5), 15)
    expect_equal(p_ceiling(loop.data, -2/3, 4), 4/3)

    expect_equal(p_ceiling(loop.data, 4/3,  0), NaN)
    expect_equal(p_ceiling(loop.data, 2/3,  0), NaN)
    expect_equal(p_ceiling(loop.data, 0,    0), NaN)
    expect_equal(p_ceiling(loop.data, -1,   0), NaN)
  }
})
