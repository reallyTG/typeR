context("Extract and Replace labelled vectors")

test_that(
  "subsets retain the label attribute",
  {
    for (av in c("logical", "integer", "numeric", "complex", "character", "raw")){
      x <- set_label(vector(av, 10), av)
      y <- x[1:3]
      expect_equal(get_label(y),
                   get_label(x))
    }
  }
)


test_that(
  "reassignments retain the label attribute",
  {
    for (av in c("logical", "integer", "numeric", "complex", "character", "raw")){
      x <- set_label(vector(av, 10), av)
      y <- x
      y[4] <- vector(av, 1)
      expect_equal(get_label(y),
                   get_label(x))
    }
  }
)


test_that(
  "reassignments allow for changing classes",
  {
    x <- set_label(1:10, "integers")
    x[3] <- pi
    expect_equivalent(unclass(x[3]),
                      pi)
  }
)
