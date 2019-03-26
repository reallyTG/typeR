context("ideal  ")














context("ideal_ ")



test_that("ideal_(poly_chars)",{
  skip_on_cran()

  R <- ring_(c("x","y"), "QQ")

  poly_chars <- c("x + y", "x^2 + y^2")
  actual <- ideal_(poly_chars)

  expect <- m2_structure(
    m2_name = m2_name(actual),
    m2_class = "m2_ideal",
    m2_meta = list(ring = R, gens = mp(poly_chars))
  )

  expect_equal(actual, expect)
})


test_that("ideal_(mpolyList)",{
  skip_on_cran()

  R <- ring_(c("x","y"), "QQ")

  mpolyList <- mp(c("x + y", "x^2 + y^2"))
  actual <- ideal_(mpolyList)

  expect <- m2_structure(
    m2_name = m2_name(actual),
    m2_class = "m2_ideal",
    m2_meta = list(ring = R, gens = mpolyList)
  )

  expect_equal(actual, expect)
})


test_that("ideal_(list o chars)",{
  skip_on_cran()

  R <- ring_(c("x","y"), "QQ")

  list_o_chars <- list("x + y", "x^2 + y^2")
  actual <- ideal_(list_o_chars)

  expect <- m2_structure(
    m2_name = m2_name(actual),
    m2_class = "m2_ideal",
    m2_meta = list(ring = R, gens = mp(unlist(list_o_chars)))
  )

  expect_equal(actual, expect)
})


test_that("ideal_(list o mps)",{
  skip_on_cran()

  R <- ring_(c("x","y"), "QQ")

  list_o_mps <- list(mp("x + y"), mp("x^2 + y^2"))
  actual <- ideal_(list_o_mps)

  expect <- m2_structure(
    m2_name = m2_name(actual),
    m2_class = "m2_ideal",
    m2_meta = list(ring = R, gens = structure(list_o_mps, class = "mpolyList"))
  )

  expect_equal(actual, expect)
})


test_that("ideal_(list o chars, raw_chars = TRUE)",{
  skip_on_cran()

  R <- ring_(c("x","y"), "QQ")

  list_o_chars <- list("x + y", "x^2 + y^2")
  actual <- ideal_(list_o_chars, raw_chars = TRUE)

  expect <- m2_structure(
    m2_name = m2_name(actual),
    m2_class = "m2_ideal",
    m2_meta = list(ring = R, gens = mp(unlist(list_o_chars)))
  )

  expect_equal(actual, expect)
})


test_that("ideal_(poly_chars, raw_chars = TRUE)",{
  skip_on_cran()

  R <- ring_(c("x","y"), "QQ")

  poly_chars <- c("x + y", "x^2 + y^2")
  actual <- ideal_(poly_chars, raw_chars = TRUE)

  expect <- m2_structure(
    m2_name = m2_name(actual),
    m2_class = "m2_ideal",
    m2_meta = list(ring = R, gens = mp(poly_chars))
  )

  expect_equal(actual, expect)
})


test_that("ideal_(c(mpoly, mpoly) errors",{
  skip_on_cran()

  R <- ring_(c("x","y"), "QQ")

  expect_error(
    ideal_(c(mp("x+y"), mp("x^2+y^2"))),
    "you appear to have used c*"
  )
})


test_that('ideal_(list("x+y x^2+y^2"), raw_chars = TRUE) errors',{
  skip_on_cran()

  R <- ring_(c("x","y"), "QQ")

  expect_error(
    ideal_(list("x+y x^2+y^2"), raw_chars = TRUE),
    "Macaulay2 Error"
  )
})













context("ideal_.")



test_that("ideal_.(poly_chars)",{
  skip_on_cran()

  R <- ring_.(c("x","y"), "QQ")

  poly_chars <- c("x + y", "x^2 + y^2")
  actual <- ideal_.(poly_chars)

  expect <- m2_structure(
    m2_name = m2_name(actual),
    m2_class = "m2_pointer",
    m2_meta = list(
      ext_str = sprintf("ideal map((%1$s)^1,(%1$s)^{{-1},{-2}},{{x+y, x^2+y^2}})", m2_name(R)),
      m2_class = "Ideal",
      m2_class_class = "Type"
    )
  )

  expect_equal(actual, expect)
})


test_that("ideal_.(mpolyList)",{
  skip_on_cran()

  R <- ring_.(c("x","y"), "QQ")

  mpolyList <- mp(c("x + y", "x^2 + y^2"))
  actual <- ideal_.(mpolyList)

  expect <- m2_structure(
    m2_name = m2_name(actual),
    m2_class = "m2_pointer",
    m2_meta = list(
      ext_str = sprintf("ideal map((%1$s)^1,(%1$s)^{{-1},{-2}},{{x+y, x^2+y^2}})", m2_name(R)),
      m2_class = "Ideal",
      m2_class_class = "Type"
    )
  )

  expect_equal(actual, expect)
})


test_that("ideal_.(list o chars)",{
  skip_on_cran()

  R <- ring_.(c("x","y"), "QQ")

  list_o_chars <- list("x + y", "x^2 + y^2")
  actual <- ideal_.(list_o_chars)

  expect <- m2_structure(
    m2_name = m2_name(actual),
    m2_class = "m2_pointer",
    m2_meta = list(
      ext_str = sprintf("ideal map((%1$s)^1,(%1$s)^{{-1},{-2}},{{x+y, x^2+y^2}})", m2_name(R)),
      m2_class = "Ideal",
      m2_class_class = "Type"
    )
  )

  expect_equal(actual, expect)
})


test_that("ideal_.(list o mps)",{
  skip_on_cran()

  R <- ring_.(c("x","y"), "QQ")

  list_o_mps <- list(mp("x + y"), mp("x^2 + y^2"))
  actual <- ideal_.(list_o_mps)

  expect <- m2_structure(
    m2_name = m2_name(actual),
    m2_class = "m2_pointer",
    m2_meta = list(
      ext_str = sprintf("ideal map((%1$s)^1,(%1$s)^{{-1},{-2}},{{x+y, x^2+y^2}})", m2_name(R)),
      m2_class = "Ideal",
      m2_class_class = "Type"
    )
  )

  expect_equal(actual, expect)
})


test_that("ideal_.(list o chars, raw_chars = TRUE)",{
  skip_on_cran()

  R <- ring_.(c("x","y"), "QQ")

  list_o_chars <- list("x + y", "x^2 + y^2")
  actual <- ideal_.(list_o_chars, raw_chars = TRUE)

  expect <- m2_structure(
    m2_name = m2_name(actual),
    m2_class = "m2_pointer",
    m2_meta = list(
      ext_str = sprintf("ideal map((%1$s)^1,(%1$s)^{{-1},{-2}},{{x+y, x^2+y^2}})", m2_name(R)),
      m2_class = "Ideal",
      m2_class_class = "Type"
    )
  )

  expect_equal(actual, expect)
})


test_that("ideal_.(poly_chars, raw_chars = TRUE)",{
  skip_on_cran()

  R <- ring_.(c("x","y"), "QQ")

  poly_chars <- c("x + y", "x^2 + y^2")
  actual <- ideal_.(poly_chars, raw_chars = TRUE)

  expect <- m2_structure(
    m2_name = m2_name(actual),
    m2_class = "m2_pointer",
    m2_meta = list(
      ext_str = sprintf("ideal map((%1$s)^1,(%1$s)^{{-1},{-2}},{{x+y, x^2+y^2}})", m2_name(R)),
      m2_class = "Ideal",
      m2_class_class = "Type"
    )
  )

  expect_equal(actual, expect)
})








test_that("ideal_.(c(mpoly, mpoly) errors",{
  skip_on_cran()

  R <- ring_.(c("x","y"), "QQ")

  expect_error(
    ideal_.(c(mp("x+y"), mp("x^2+y^2"))),
    "you appear to have used c*"
  )
})


test_that('ideal_.(list("x+y x^2+y^2"), raw_chars = TRUE) errors',{
  skip_on_cran()

  R <- ring_.(c("x","y"), "QQ")

  expect_error(
    ideal_.(list("x+y x^2+y^2"), raw_chars = TRUE),
    "Macaulay2 Error"
  )
})







