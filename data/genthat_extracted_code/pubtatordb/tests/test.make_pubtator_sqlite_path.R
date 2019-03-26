context("make_pubtator_sqlite_path")

test_that(
  "invalid inputs produce an error",
  {
    # When there is no argument.
    expect_error({
      make_pubtator_sqlite_path()
    })

    # When the argument is a data.frame.
    expect_error({
      make_pubtator_sqlite_path(iris)
    })
  }
)

test_that(
  "valid inputs produce valid output",
  {
    # When there is a string argument.
    expect_type(make_pubtator_sqlite_path("Test"), "character")
  }
)



