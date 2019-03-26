context("qiita_get_users")

test_that("qiita_get_users works", {
  skip_on_cran()
  users <- qiita_get_users("yutannihilation")
  expect_equal(length(users), 1)
  expect_equal(users[[1]]$id, "yutannihilation")
})

test_that("qiita_is_following_user works", {
  skip_on_cran()
  expect_true(qiita_is_following_user("uri"))
  # I don't follow myself :)
  expect_false(qiita_is_following_user("yutannihilation"))
})

test_that("qiita_get_authenticated_user works", {
  skip_on_cran()
  expect_equal(qiita_get_authenticated_user()$id, "yutannihilation")
})
