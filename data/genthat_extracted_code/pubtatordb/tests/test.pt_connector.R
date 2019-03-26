context("pt_connector")

test_that(
  "invalid inputs produce an error",
  {
    # When pt_path is a data.frame.
    expect_error({
      pt_connector(iris)
    })
  }
)
