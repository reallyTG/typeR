context("Translation to Digraph")


test_that("Correct translation", {
  data.1 <- data.frame(from = c("s", "s", "s", "u", "u", "w", "w", "x", "x", "v", "v", "y", "y"),
                       to = c("u", "w", "x", "w", "v", "v", "y", "w", "y", "y", "t", "t", "u"),
                       cost = c(1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L),
                       stringsAsFactors = FALSE)
  expected.1 <- structure(list(from = c("s", "s", "s", "u", "u", "w", "w", "x", "x", "v","v", "y", "y", "u", "w",
                                        "x", "w", "v", "v", "y", "w", "y", "y", "t", "t", "u"),
                               to = c("u", "w", "x", "w", "v", "v", "y", "w", "y", "y", "t", "t", "u", "s", "s",
                                      "s", "u", "u", "w", "w", "x", "x", "v", "v", "y", "y"),
                               cost = c(1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L,
                                        1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L)),
                          .Names = c("from", "to", "cost"), row.names = c(NA, -26L), class = "data.frame")
  
  expect_equal(direct_graph(data.1), expected.1)
})



test_that("Incorrect input", {
  expect_error(direct_graph(NULL, 2L))
  expect_error(direct_graph(NA))
  expect_error(direct_graph(c(123, 456, 789), 2L))
})
