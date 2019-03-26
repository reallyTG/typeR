context("factor_n ")

test_that("factor_n(formats)", {
  skip_on_cran()

  param1 <- list(
    218700,
    "218700",
    m2.("218700")
  )

  expected_output <- list(prime = c(2L, 3L, 5L), power = c(2L, 7L, 2L))

  apply(expand.grid(param1, list(1)), 1, FUN = function(x) {

    factors <- factor_n(x[[1]])

    expect_equal(factors, expected_output)

  })

})


test_that("factor_n(1)", {
  skip_on_cran()

  expect_equal(
    factor_n(1),
    list(prime = integer(0), power = integer(0))
  )

})


test_that("factor_n(negative)", {
  skip_on_cran()

  expect_equal(
    factor_n(-55),
    list(prime = c(-1L, 5L, 11L), power = c(1L, 1L, 1L))
  )

})




context("factor_n.")

test_that("factor_n.(formats)", {
  skip_on_cran()

  param1 <- list(
    218700,
    "218700",
    m2.("218700")
  )

  apply(expand.grid(param1, list(1)), 1, FUN = function(x) {

    factors <- factor_n.(x[[1]])

    expected_output <- m2_structure(
      m2_name = m2_name(factors),
      m2_class = "m2_pointer",
      m2_meta = list(
        ext_str = "new Product from {new Power from {2,2},new Power from {3,7},new Power from {5,2}}",
        m2_class = "Product",
        m2_class_class = "WrapperType"
      )
    )

    expect_equal(factors, expected_output)

  })

})







