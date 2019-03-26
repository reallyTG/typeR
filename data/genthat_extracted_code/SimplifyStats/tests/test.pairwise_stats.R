context("pairwise_stats")

test_that(
  "invalid inputs produce an error",
  {
    expect_error({
      input <- data.frame(
        "x" = c(0),
        "y" = c(0)
      )
      input <- input[-1,]
      pairwise_stats(input, "Species", "Sepal.Length", t.test)
    })
    
    expect_error({
      pairwise_stats(iris, "Specie", "Sepal.Length", t.test)
    })
    
    expect_error({
      pairwise_stats(iris, "Species", "Sepal", t.test)
    })
    
    expect_error({
      pairwise_stats(iris, "Species", "Sepal.Length", "t.test")
    })
  }
)

test_that(
  "valid input produce valid output",
  {
    expect_true({
      expectation <- c(1e-16, 1e-24, 1e-06)
      computation <- pairwise_stats(
        iris, "Species", "Sepal.Length", 
        t.test
      )$p.value
      computation <- signif(computation, 3)
      all(computation <= expectation)
    })
  }
)
