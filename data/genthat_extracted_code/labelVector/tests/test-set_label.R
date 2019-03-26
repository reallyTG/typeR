context("set_label")

for (av in c("logical", "integer", "numeric", "complex", "character", "raw")){
  test_that(
    sprintf("label is set for vector of class %s", av),
    {
      expect_silent(
        set_label(vector(av, 10), av)
      )
    }
  )
}

test_that(
  "Cast an error if x is not atomic",
  {
    x <- vector("list", 10)
    expect_error(
      set_label(x, "list")
    )
  }
)

test_that(
  "Cast an error if label is not character(1)",
  {
    x <- vector("integer", 10)
    expect_error(
      set_label(x, mtcars)
    )
  }
)

test_that(
  "Cast an error if label is not character(1)",
  {
    x <- vector("integer", 10)
    expect_error(
      set_label(x, character(0))
    )
  }
)

test_that(
  "Cast an error if label is not character(1)",
  {
    x <- vector("integer", 10)
    expect_error(
      set_label(x, character(2))
    )
  }
)
