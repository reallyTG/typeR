context("Tests of functions spitcenternat and spitcenternatlist")

df1 <- data.frame(
  x = c(rep(0, 6), seq(0.2, 2.8, 0.2), seq(0.2, 2.8, 0.2), rep(3,6)),
  y = c(seq(0, 1, 0.2), rep(0, 14), rep(1, 14), seq(0, 1, 0.2)),
  z = c(rep(0.9, 6), rep(0.9, 14), rep(1.3, 14), rep(1.2, 6))
)

df2 <- data.frame(
  x = c(rep(0, 6), seq(0.2, 2.8, 0.2), seq(0.2, 2.8, 0.2), rep(3,6)),
  y = c(seq(0, 1, 0.2), rep(0, 14), rep(1, 14), seq(0, 1, 0.2)),
  z = c(rep(0.6, 6), rep(0.6, 14), rep(1.0, 14), rep(0.9, 6))
)

df3 <- data.frame(
  x = c(rep(0, 6), seq(0.2, 2.8, 0.2), seq(0.2, 2.8, 0.2), rep(3,6)),
  y = c(seq(0, 1, 0.2), rep(0, 14), rep(1, 14), seq(0, 1, 0.2)),
  z = c(rep(0.3, 6), rep(0.3, 14), rep(0.7, 14), rep(0.6, 6))
)

lpoints <- list(df1, df2, df3)

maps <- kriglist(lpoints, lags = 3, model = "spherical")

hexatestdf1 <- data.frame(
  x = c(1, 1, 1, 1, 2, 2, 2, 2),
  y = c(0, 1, 0, 1, 0, 1, 0, 1)
)

hexatestdf2 <- data.frame(
  x = c(0, 0, 0, 0, 1, 1, 1, 1),
  y = c(0, 1, 0, 1, 0, 1, 0, 1)
)

hexs <- list(hexatestdf1, hexatestdf2)

sn <- spitcenternat(hexatestdf1, maps)
snl <- spitcenternatlist(hexs, maps)



test_that(
  "the output of spitcenternat is a data.frame",  {
    expect_true(
      is.data.frame(sn)
    )
  }
)

test_that(
  "the output of spitcenternatlist is a list",  {
    expect_true(
      is.list(snl)
    )
  }
)

test_that(
  "the output of spitcenternat has the correct amount of rows and columns and the correct colnames",  {
    expect_equal(
      ncol(sn),
      3
    )
    expect_equal(
      nrow(sn),
      length(maps) - 1
    )
    expect_equal(
      colnames(sn),
      c("x", "y", "z")
    )
  }
)

test_that(
  "the output of spitcenternatlist has the correct length",  {
    expect_equal(
      length(snl),
      length(hexs)
    )
  }
)

countersnl <- list(
  data.frame(
    x = c(1.5, 1.5),
    y = c(0.5, 0.5),
    z = c(0.944, 0.644)
  ),
  data.frame(
    x = c(0.5, 0.5),
    y = c(0.5, 0.5),
    z = c(0.923, 0.623)
  )
)

snl[[1]]$z <- round(snl[[1]]$z, 3)
snl[[2]]$z <- round(snl[[2]]$z, 3)

test_that(
  "the output of spitcenternatlist (and spitcenternat) is as expected",  {
    expect_identical(
      snl,
      countersnl
    )
  }
)