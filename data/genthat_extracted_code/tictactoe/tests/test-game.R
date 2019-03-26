library(tictactoe)
library(testthat)
library(combiter)

context("ttt game")


test_that("invalid ai", {
  expect_error(ttt(1, 2))
  expect_error(ttt(structure(1, class = "ttt_player"),
                   structure(2, class = "ttt_player")))
  expect_error(ttt(structure(list(1), class = "ttt_player"),
                   structure(list(2), class = "ttt_player")))
})



test_that("index conversion", {
  g <- ttt_game()
  ## index to index (identical)
  expect_equal(g$to_index(1), 1L)
  expect_equal(g$to_index(8), 8L)

  ## 2-length integer to index
  expect_equal(g$to_index(c(2, 2)), 5L)
  expect_equal(g$to_index(c(3, 1)), 3L)

  ## string to index
  expect_equal(g$to_index("b1"), 4L)
  expect_equal(g$to_index("c2"), 8L)


  ## to string
  expect_equal(g$index_to_str(1), "A1")
  expect_equal(g$index_to_str(3), "A3")
  expect_equal(g$index_to_str(6), "B3")
  expect_equal(g$index_to_str(c(1, 3)), "C1")
  expect_equal(g$index_to_str(c(2, 3)), "C2")
  expect_equal(g$index_to_str(c(3, 2)), "B3")

})

