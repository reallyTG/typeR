context("get_label")

for (av in c("logical", "integer", "numeric", "complex", "character", "raw")){
  x <- set_label(vector(av, 10), av)
  test_that(
    sprintf("label is retrieved for vector of class %s", av),
    {
      expect_equal(
        get_label(x),
        av
      )
    }
  )
}

for (av in c("logical", "integer", "numeric", "complex", "character", "raw")){
  x <- vector(av, 10)
  test_that(
    sprintf("variable names is returned for unlabelled vector of class %s", av),
    {
      expect_equal(
        get_label(x),
        "x"
      )
    }
  )
}

test_that(
  "Cast an error when x is not atomic",
  {
    expect_error(
      get_label(vector("list", 10))
    )
  }
)

