context("pt_to_sql")

test_that(
  "invalid inputs produce an error",
  {
    # When pt_path is not a string.
    expect_error({
      pt_to_sql(
        pt_path = iris,
        skip_behavior = TRUE,
        remove_behavior = FALSE
      )
    })

    # When skip_behavior is not a flag.
    expect_error({
      pt_to_sql(
        pt_path = "A path",
        skip_behavior = iris,
        remove_behavior = FALSE
      )
    })

    # When remove_behavior is not a flag.
    expect_error({
      pt_to_sql(
        pt_path = "A path",
        skip_behavior = TRUE,
        remove_behavior = iris
      )
    })
  }
)
