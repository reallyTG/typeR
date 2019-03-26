context("low level functions")

test_that("request() works", {
  response <- request("https://ims-fhs.upwave.io/api/boards/",
                               "a44fa67c5df2acc9836058ffca870d7b78b017cb")

  expect_that(response, is_a("response"))
  expect_that(response$status_code, equals(200))
})

test_that("content_as_list() works", {
  result <- content_as_list(request(
    "https://ims-fhs.upwave.io/api/boards/",
    "a44fa67c5df2acc9836058ffca870d7b78b017cb"))

  expect_that(result, is_a("list"))
  expect_that(length(result), equals(4))
})

context("Board list and details")

test_that("list_boards() works", {
  list_boards <- list_boards("ims-fhs",
                                    "a44fa67c5df2acc9836058ffca870d7b78b017cb")
  expect_that(list_boards, is_a("list"))
  expect_that(length(list_boards), equals(4))

  list_boards <- list_boards("bad-url",
                                    "a44fa67c5df2acc9836058ffca870d7b78b017cb")
  expect_that(list_boards, is_a("list"))
  expect_that(length(list_boards), equals(1))
  expect_that(list_boards$detail, equals("Bad url"))

  board_details <- board_details("bad-url", 1234,
                                    "a44fa67c5df2acc9836058ffca870d7b78b017cb")
  expect_that(board_details, is_a("list"))
  expect_that(length(board_details), equals(1))
  expect_that(board_details$detail, equals("Bad url"))
})

test_that("board_details() works", {

  id <- 14351
  board_details <- board_details("ims-fhs", id,
                                    "a44fa67c5df2acc9836058ffca870d7b78b017cb")
  expect_that(board_details, is_a("list"))
  expect_gt(length(board_details), 1)
  expect_that(board_details$id, equals(id))

})


context("Card list and details")
test_that("list_cards() works", {
  list_cards <- list_cards("ims-fhs", 14351, "a44fa67c5df2acc9836058ffca870d7b78b017cb")
  expect_that(list_cards, is_a("list"))
  expect_that(length(list_cards), equals(4))
})

context("Write boards and cards")
test_that("create_card_from_excel() works", {
  # token <- "a44fa67c5df2acc9836058ffca870d7b78b017cb"
  # res <- create_card_from_excel(excel_file = "inst/extdata/helper_user_stories.xlsx",
  #                               sheet = 2, line_number = 1, organisation = "ims-fhs", board_id = 14351,
  #                               board_name = "upwaver_tests", token = token)
  #
  # expect_that(res$status_code, equals(200))
  # expect_error(
  #   create_card_from_excel(organisation = "ims-fhs", board_id = 14351, board_name = "upwaver_tests",
  #            token = token, excel_file = "helper_user_stories.xlsx", sheet = 2, line_number = 1))
})

context("Storypoints")
test_that("storypoints() works", {
  storypoints <- storypoints_and_status("ims-fhs", 14351, "a44fa67c5df2acc9836058ffca870d7b78b017cb")
  expect_that(storypoints, is_a("list"))
  expect_that(storypoints$sum_storypoints, is_a("numeric"))
})

test_that("aufwand() works", {
  expect_equal(aufwand("Aufwand: 10 AT"), 10)
  expect_equal(aufwand("Aufwand: 10 SP"), 10)
  expect_equal(aufwand("blabla"), 0)
  expect_error(aufwand(3))
})
