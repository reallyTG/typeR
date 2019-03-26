context("factor_poly ")


test_that("factor_poly(formats)", {
  skip_on_cran()

  # define ring
  ring_(c("x","y"), "QQ")

  # define expected output
  expected_output <- list(
    factor = mp(c("x-y", "x+y", "x^2+y^2")),
    power = c(1L, 1L, 1L)
  )

  expect_equal(
    factor_poly("x^4 - y^4"),
    expected_output
  )

  expect_equal(
    factor_poly(mp("x^4 - y^4")),
    expected_output
  )

  expect_equal(
    factor_poly(m2.("x^4 - y^4")),
    expected_output
  )


})


test_that("factor_poly(1)", {
  skip_on_cran()

  # define ring
  ring_(c("x","y"), "QQ")

  # define expected output
  expected_output <- list(
    factor = structure(list(), class = "mpolyList"),
    power = integer(0)
  )

  # run tests
  expect_equal(
    factor_poly(1),
    expected_output
  )

  expect_equal(
    factor_poly("1"),
    expected_output
  )

  expect_equal(
    factor_poly(mp("1")),
    expected_output
  )

  expect_equal(
    factor_poly(m2.("1")),
    expected_output
  )

})





context("factor_poly.")


test_that("factor_poly(formats)", {
  skip_on_cran()

  # define ring
  ring_(c("x","y"), "QQ")

  # define expected
  expected <- function(name) m2_structure(
    m2_name = name,
    m2_class = "m2_pointer",
    m2_meta = list(
      ext_str = "new Product from {new Power from {x-y,1},new Power from {x+y,1},new Power from {x^2+y^2,1}}",
      m2_class = "Product",
      m2_class_class = "WrapperType"
    )
  )

  # run tests
  actual <- factor_poly.("x^4 - y^4")
  expect_equal(actual, expected(m2_name(actual)))

  actual <- factor_poly.(mp("x^4 - y^4"))
  expect_equal(actual, expected(m2_name(actual)))

  actual <- factor_poly.(m2.("x^4 - y^4"))
  expect_equal(actual, expected(m2_name(actual)))

})

