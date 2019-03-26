context("Tests of functions pnp and pnpmulti")

polydf <- data.frame(
  x = c(1,1,2,2),
  y = c(1,2,1,2)
)

pisin <- pnp(polydf$x, polydf$y, 1.5, 1.5)
pisout <- pnp(polydf$x, polydf$y, 2.5, 2.5)

testdf <- data.frame(
  x = c(1.5, 2.5),
  y = c(1.5, 2.5)
)

multi <- pnpmulti(polydf$x, polydf$y, testdf$x, testdf$y)

test_that(
  "the output of pnp is a boolean value",  {
    expect_true(
      is.logical(pisin)
    )
    expect_true(
      is.logical(pisout)
    )
  }
)

test_that(
  "the output of pnpmulti is a boolean vector",  {
    expect_true(
      is.logical(multi)
    )
  }
)

test_that(
  "the output of pnpmuti has the correct amout of values",  {
    expect_equal(
      length(multi),
      nrow(testdf)
    )
  }
)

test_that(
  "the output of pnp is as expected",  {
    expect_true(
      pisin
    )
    expect_false(
      pisout
    )
  }
)

test_that(
  "the output of pnpmulti is as expected",  {
    expect_identical(
      multi,
      c(TRUE, FALSE)
    )
  }
)