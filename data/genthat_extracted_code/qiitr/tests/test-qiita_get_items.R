context("qiita_get_items")


test_that("qiita_get_items by tag ID", {
  skip_on_cran()
  expect_equal(qiita_get_items(tag_id = "R", per_page = 3L, page_limit = 1L),
               qiita_get_items(tag_id = "R", per_page = 1L, page_limit = 3L))
})

test_that("qiita_get_items by item ID", {
  skip_on_cran()
  item <- qiita_get_items(item_id = "7a78d897810446dd6a3b")
  expect_equal(length(item), 1)
  expect_equal(item[[1]]$user$id, "yutannihilation")
})

test_that("qiita_get_items by item ID", {
  skip_on_cran()
  item <- qiita_get_items(user_id = "yutannihilation")
  expect_true("7a78d897810446dd6a3b" %in% purrr::map_chr(item, "id"))
  expect_true(all(purrr::map_chr(item, c("user", "id")) == "yutannihilation"))
})
