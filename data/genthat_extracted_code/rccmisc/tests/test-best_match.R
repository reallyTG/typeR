
context("best_match")

test_that("misc", {
  
  best_match("petal", names(iris)) %>%
    expect_equivalent("Petal.Length")
  
  best_match("petal", names(iris), all = TRUE) %>%
    expect_equivalent(c("Petal.Length", "Petal.Width"))
})