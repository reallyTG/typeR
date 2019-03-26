context("Tests of function posdec")

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

maps <- kriglist(lpoints, lags = 3, model = "spherical")

hexadf1 <- data.frame(
  x = c(0, 1, 0, 4, 5, 5, 5, 5),
  y = c(1, 1, 4, 4, 1, 1, 4, 4),
  z = c(1, 5, 1, 6, 1, 5, 1, 3)
)

hexadf2 <- data.frame(
  x = c(0, 1, 0, 4, 5, 5, 5, 5),
  y = c(1, 1, 4, 4, 1, 1, 4, 4),
  z = c(-1, -5, -1, -6, -1, -5, -1, -3)
)

cx1 <- fillhexa(hexadf1, 0.3)
cx2 <- fillhexa(hexadf2, 0.3)

cubelist <- list(cx1, cx2)

res1 <- posdec(cx1, maps)
res2 <- posdeclist(cubelist, maps)

test_that(
  "the output of posdec is a data.frame",  {
    expect_true(
      is.data.frame(res1)
    )
  }
)

test_that(
  "the output of posdeclist is a list",  {
    expect_true(
      is.list(res2)
    )
  }
)

test_that(
  "the output of posdec has the correct amount of columns and colnames",  {
    expect_equal(
      ncol(res1),
      4
    )
    expect_equal(
      colnames(res1),
      c("x", "y", "z", "pos")
    )
  }
)

test_that(
  "the output of posdec has the correct amount of rows",  {
    expect_equal(
      nrow(res1),
      nrow(cx1)
    )
  }
)

test_that(
  "the output of posdeclist has the correct amount of result data.frames",  {
    expect_equal(
      length(res2),
      length(cubelist)
    )
  }
)

test_that(
  "the output column pos of posdec has the correct range",  {
    expect_true(
      all(range(res1$pos) %in% c(0, 1, 2))
    )
  }
)