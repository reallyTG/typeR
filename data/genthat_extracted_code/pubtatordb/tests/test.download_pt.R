context("download_pt")

test_that(
  "invalid inputs produce an error",
  {
    # When there is no argument.
    expect_error({
      download_pt()
    })

    # When the argument is a data.frame
    expect_error({
      download_pt(iris)
    })
  }
)
