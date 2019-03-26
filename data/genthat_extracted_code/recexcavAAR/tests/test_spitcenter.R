context("Tests of function spitcenter")

hexatestdf <- data.frame(
  x = c(0,1,0,4,5,5,5,5),
  y = c(1,1,4,4,1,1,4,4),
  z = c(4,8,4,9,4,8,4,6)
)

center <- spitcenter(hexatestdf)

test_that(
  "the output is a vector",  {
    expect_true(
      is.vector(center)
    )
  }
)

test_that(
  "the output has the correct length and names",  {
    expect_equal(
      length(center),
      3
    )
    expect_equal(
      names(center),
      c("x", "y", "z")
    )
  }
)

countercenter <- c(x = 3.125, y = 2.5, z = 5.875)

test_that(
  "the output is as expected",  {
    expect_identical(
      center,
      countercenter
    )
  }
)
