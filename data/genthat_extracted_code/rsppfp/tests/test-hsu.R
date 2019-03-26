context("Hsu's Backward Construction")


test_that("Default example", {
  data.graph <- data.frame(from = c("s", "s", "s", "u", "u", "w", "w", "x", "x", "v", "v", "y", "y"),
                           to = c("u", "w", "x", "w", "v", "v", "y", "w", "y", "y", "t", "t", "u"),
                           cost = c(1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L),
                           stringsAsFactors = FALSE)
  data.fpaths <- data.frame(V1 = c("u", "u", "w", "x"), V2 = c("v", "w", "v","w"), 
                            V3 = c("y", "y", "y", "v"), V4 = c("u", "u", NA, "y"), 
                            V5 = c(NA, NA, NA, "t"), stringsAsFactors = FALSE)

  expected.gStar <- data.frame(from = c("s", "s", "s", "w", "x", "v", "v", "y", "y", "u", "u|v",
                                        "u", "u|w", "w", "x", "x|w", "w|v", "x|w", "x|w|v", 
                                        "u|v", "u|v|y", "u|w"), 
                               to = c("u", "w", "x", "y", "y", "y", "t", "t", "u", "u|v", 
                                      "u|v|y", "u|w", "u|v|y", "w|v", "x|w", "x|w|v", "t", 
                                       "y", "t", "t", "t", "w|v"), 
                               cost = c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
                               stringsAsFactors = FALSE)
  row.names(expected.gStar) <- c(1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 9L, 10L, 11L, 12L, 13L, 23L, 24L, 
                                            25L, 26L, 27L, 28L, 29L, 30L, 31L)
  
  
  expect_equal(modify_graph_hsu(data.graph, data.fpaths), expected.gStar)
})



test_that("Additional example", {
  data.graph <- data.frame(from = c("c", "c", "u", "u", "t", "a", "a", "r", "e", "e", "e", "p", "i", "i", "n", "o"),
                           to = c("u", "p", "e", "t", "a", "r", "i", "u", "r", "i", "p", "n", "n", "o", "o", "m"),
                           stringsAsFactors = FALSE)
  data.fpaths <- data.frame(V1 = c("u", "p", "a"), V2 = c("t", "n", "i"),
                            V3 = c("a", "o", "n"), V4 = c("r", "m", "o"), V5 = c("u", NA, NA),
                            stringsAsFactors = FALSE)

  expected.gStar <- data.frame(from = c("c", "c", "u", "t", "a", "r", "e", "e", "e", "i", "i", 
                                            "n", "o", "u", "u|t", "u|t|a", "p", "p|n", "a", 
                                            "a|i", "u|t|a", "a|i"),
                               to = c("u", "p", "e", "a", "r", "u", "r", "i", "p", "n", "o", 
                                      "o", "m", "u|t", "u|t|a", "u|t|a|r", "p|n", "p|n|o", 
                                          "a|i", "a|i|n", "a|i", "o"),
                               stringsAsFactors = FALSE)
   row.names(expected.gStar) <- c(1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 9L, 10L, 11L, 12L, 
                                  13L, 27L, 28L, 29L, 30L, 31L, 32L, 33L, 34L, 35L)
  

  expect_equal(modify_graph_hsu(data.graph, data.fpaths), expected.gStar)
})




test_that("Wrong input", {
  data.graph <- data.frame(from = c("s", "s", "s", "u", "u", "w", "w", "x", "x", "v", "v", "y", "y"),
                           to = c("u", "w", "x", "w", "v", "v", "y", "w", "y", "y", "t", "t", "u"),
                           cost = c(1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L),
                           stringsAsFactors = FALSE)
  data.fpaths <- data.frame(V1 = c("u", "u", "w", "x"), V2 = c("v", "w", "v","w"), V3 = c("y", "y", "y", "v"),
                            V4 = c("u", "u", NA, "y"), V5 = c(NA, NA, NA, "t"),
                            stringsAsFactors = FALSE)

  expect_error(modify_graph_hsu(NULL, data.fpaths, 1L))
  expect_error(modify_graph_hsu(NA, NA))
  expect_error(modify_graph_hsu(data.graph, NULL))
  expect_error(modify_graph_hsu("123", data.fpaths))
  expect_error(modify_graph_hsu(data.graph, 1234))
  expect_error(modify_graph_hsu(c(123,46), c(789,456)))
})
