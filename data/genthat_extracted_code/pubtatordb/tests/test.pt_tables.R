context("pt_tables")

test_that(
  "invalid inputs produce an error",
  {
    # When there is no argument.
    expect_error({
      pt_tables()
    })

    # When db_con is a data.frame.
    expect_error({
      pt_tables(iris)
    })
  }
)
