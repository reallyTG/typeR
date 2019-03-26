context("get_label.data.frame")

test_that(
  "cast an error if x is not a data frame",
  {
    expect_error(
      get_label.data.frame(letters, a = "A")
    )
  }
)

test_that(
  "Cast an error if any element in vars is not a column in x",
  {
    expect_error(
      get_label(mtcars,
                vars = "ABC")
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
      get_label(A,
                abc = "lists")
    )
  }
)

test_that(
  "get_label works for data frames with no labels assigned",
  {
    expect_equal(get_label(mtcars),
                 names(mtcars))
  }
)

test_that(
  "get_label works for data frames with no labels assigned and vars != NULL",
  {
    expect_equal(get_label(mtcars, vars = c("mpg", "gear", "am")),
                 c("mpg", "gear", "am"))
  }
)

test_that(
  "get_label works for data frames with labels and vars = NULL",
  {
    A <- set_label(mtcars,
                   mpg = "miles per gallon",
                   gear = "gears",
                   am = "Automatic")
    expect_equal(get_label(A),
                 c("miles per gallon", "cyl", "disp", "hp", "drat", "wt", "qsec",
                   "vs", "Automatic", "gears", "carb"))
  }
)

test_that(
  "get_label works for data frames with labels and vars != NULL",
  {
    A <- set_label(mtcars,
                   mpg = "miles per gallon",
                   gear = "gears",
                   am = "Automatic")
    expect_equal(get_label(A, vars = c("mpg", "gear", "am", "hp")),
                 c("miles per gallon", "gears", "Automatic", "hp"))
  }
)
