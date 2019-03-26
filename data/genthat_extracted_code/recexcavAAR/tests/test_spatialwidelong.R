context("Tests of functions spatialwide and spatiallong")

x <- c(1, 1, 1, 2, 2, 2, 3, 3, 4)
y <- c(1, 2, 3, 1, 2, 3, 1, 2, 3)
z <- c(3, 4, 2, 3, NA, 5, 6, 3, 1)

sw <- spatialwide(x, y, z, digits = 3)

sl <- spatiallong(sw$x, sw$y, sw$z)

test_that(
  "the output of spatialwide is a list",  {
    expect_true(
      is.list(sw)
    )
  }
)

test_that(
  "the output of spatiallong is a data.frame",  {
    expect_true(
      is.data.frame(sl)
    )
  }
)

test_that(
  "the output of spatialwide has the correct elements",  {
    expect_equal(
      names(sw),
      c("x", "y", "z")
    )
  }
)

test_that(
  "the output for z of spatialwide has the correct amount of rows and columns",  {
    expect_equal(
      ncol(sw$z),
      length(unique(x))
    )
    expect_equal(
      nrow(sw$z),
      length(unique(y))
    )
  }
)

test_that(
  "the output of spatiallong has the correct amount of rows and columns",  {
    expect_equal(
      ncol(sl),
      3
    )
    expect_equal(
      nrow(sl),
      length(z[!is.na(z)])
    )
  }
)

test_that(
  "the output of spatiallong has the correct colnames",  {
    expect_equal(
      colnames(sl),
      c("x", "y", "z")
    )
  }
)

countersw <- list(
  x = as.numeric(c("1", "2", "3", "4")),
  y = as.numeric(c("1", "2", "3")),
  z = matrix(as.numeric(c(3, 4, 2, 3, NA, 5, 6, 3, NA ,NA, NA, 1)), 3, 4)
)

test_that(
  "the output of spatialwide contains the correct values in an example setup",  {
    expect_identical(
      sw,
      countersw
    )
  }
)

countersl <- data.frame(
  x = as.numeric(c("1", "1", "1", "2", "2", "3", "3", "4")),
  y = as.numeric(c("1", "2", "3", "1", "3", "1", "2", "3")),
  z = as.numeric(c("3", "4", "2", "3", "5", "6", "3", "1"))
)

test_that(
  "the output of spatiallong contains the correct values in an example setup",  {
    expect_identical(
      sl,
      countersl
    )
  }
)