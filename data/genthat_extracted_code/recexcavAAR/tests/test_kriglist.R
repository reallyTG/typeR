context("Tests of function kriglist")

df1 <- data.frame(
  x = rnorm(50),
  y = rnorm(50),
  z = rnorm(50) - 5
)

df2 <- data.frame(
  x = rnorm(50),
  y = rnorm(50),
  z = rnorm(50) + 5
)

lpoints <- list(df1, df2)

res <- kriglist(lpoints, lags = 3, model = "spherical")

test_that(
  "the output of spatialwide is a list of data.frames",  {
    expect_true(
      is.list(res)
    )
    expect_true(
      is.data.frame(res[[1]])
    )
    expect_true(
      is.data.frame(res[[2]])
    )
  }
)

test_that(
  "the output data.frames of spatialwide have the correct colnames",  {
    expect_equal(
      colnames(res[[1]]),
      c("x", "y", "pred")
    )
    expect_equal(
      colnames(res[[2]]),
      c("x", "y", "pred")
    )
  }
)