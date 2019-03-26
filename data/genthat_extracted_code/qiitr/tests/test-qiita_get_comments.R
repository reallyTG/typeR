context("qiita_get_comments")

test_that("qiita_get_comments with comment id works", {
  skip_on_cran()
  comment <- qiita_get_comments(comment_id = "1fdbb164e19d79e10203")
  expect_equal(length(comment), 1)
  expect_equal(comment[[1]]$user$id, "yutannihilation")
})

test_that("qiita_get_comments with item id works", {
  skip_on_cran()
  comment <- qiita_get_comments(item_id = "b4130186e1e095719dcb")
  expect_equal(length(comment), 2)
  expect_equal(purrr::map_chr(comment, "id"), c("1fdbb164e19d79e10203", "125223f52f2f1ecbe62a"))
})
