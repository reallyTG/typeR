context("pt_columns")

test_that(
  "invalid inputs produce an error",
  {
    # When db_con is a string instead of a SQLiteConnection.
    expect_error({
      pt_columns("db_con", "gene")
    })
  }
)
