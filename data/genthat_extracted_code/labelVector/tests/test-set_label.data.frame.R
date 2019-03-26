context("set_label.data.frame")

test_that(
  "cast an error if x is not a data frame",
  {
    expect_error(
      set_label.data.frame(letters, a = "A")
    )
  }
)

test_that(
  "Cast an error if any element in vars is not a column in x",
  {
    expect_error(
      set_label(mtcars,
                abc = "ABC")
    )
  }
)

test_that(
  "Cast an error if any element in vars is not an atomic vector",
  {
    A <- data.frame(abc = rep(NA, 3))
    A[[1]][1] <- list(letters)
    A[[1]][2] <- list(LETTERS)
    A[[1]][3] <- list(months)
    expect_error(
      set_label(A,
                abc = "lists")
    )
  }
)

test_that(
  "set_label works for data frames",
  {
    expect_silent(set_label(mtcars,
                            am = "Automatic",
                            mpg = "Miles per gallon"))
  }
)

test_that(
  "set_label casts and error when given an unnamed vector",
  {
    expect_error(
      set_label(mtcars, "")
    )
  }
)
