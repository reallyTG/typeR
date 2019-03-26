context("pt_select")

test_that(
  "invalid inputs produce an error",
  {
    # The following will fail because table_name is not a string. However, even
    # if it did not fail because of that it would fail because of db_con shortly
    # thereafter.
    expect_error({
      pt_select(
        db_con = "A string",
        table_name = iris,
        columns = NULL,
        keys = NULL,
        keytype = NULL,
        limit = Inf
      )
    })

    # This will fail because of db_con.
    expect_error({
      pt_select(
        db_con = "A string",
        table_name = "gene",
        columns = NULL,
        keys = NULL,
        keytype = NULL,
        limit = Inf
      )
    })
  }
)
