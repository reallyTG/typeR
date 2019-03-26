context("m2_matrix")


test_that("m2_matrix(mat)", {
  skip_on_cran()


  stop_m2()
  start_m2()

  M <- matrix(c(
       1,    2,    3,
       1,   34,   45,
    2213, 1123, 6543,
       0,    0,    0
  ), nrow = 4, byrow = TRUE)

  actual <- m2_matrix(M)

  expect <- m2_structure(
    M,
    m2_name = m2_name(actual),
    m2_class = "m2_matrix",
    m2_meta = list(ring = m2_structure(
      m2_name = "ZZ",
      m2_meta = list(vars = NULL, coefring = "ZZ", order = "grevlex"),
      m2_class = "m2_polynomialring"
    )),
    base_class = "matrix"
  )

  expect_equal(actual, expect)

})









test_that("m2_matrix.(mat)", {
  skip_on_cran()

  M <- matrix(c(
       1,    2,    3,
       1,   34,   45,
    2213, 1123, 6543,
       0,    0,    0
  ), nrow = 4, byrow = TRUE)

  actual <- m2_matrix.(M)

  expect <- structure(NA,
    class = c("m2_pointer", "m2"),
    m2_name = m2_name(actual),
    m2_meta = list(
      ext_str = "map((ZZ)^4,(ZZ)^3,{{1, 2, 3}, {1, 34, 45}, {2213, 1123, 6543}, {0, 0, 0}})",
      m2_class = "Matrix",
      m2_class_class = "Type"
    )
  )

  expect_equal(actual, expect)

})
