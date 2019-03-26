context("check basic usage works")

test_that(
  "check basic usage works",
  {
    libsnap <- library_snapshot()

    expect_true(
      "data.frame" %in% class(libsnap)
    )

    expect_true(
      ncol(libsnap) > 0
    )

    expect_true(
      nrow(libsnap) > 0
    )
  }
)