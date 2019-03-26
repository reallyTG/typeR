context("ring  ")



context("ring_ ")





test_that("ring_(formats)",{
  skip_on_cran()

  param1 <- list(
    c("x"),
    c("x","y"),
    letters
  )

  param2 <- as.list(m2_coefrings())

  param3 <- as.list(m2_termorders())

  apply(expand.grid(param1, param2, param3), 1, FUN = function(x) {

    R <- ring_(x[[1]], coefring = x[[2]], order = x[[3]])

    expected_output <- m2_structure(
      m2_name = m2_name(R),
      m2_class = "m2_polynomialring",
      m2_meta = list(
        vars = x[[1]],
        coefring = x[[2]],
        order = x[[3]]
      )
    )

    expect_equal(R, expected_output)
    expect_equal(R, m2_parse(m2_name(R)))

  })

})




