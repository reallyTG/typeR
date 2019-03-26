context("strip_query")

test_that("strip_query strips limit and offset", {
  expect_equal(strip_query("limit 1"), "")
  expect_equal(strip_query("limit    1 "), " ")
  expect_equal(strip_query("a limit 1"), "a ")
  expect_equal(strip_query("offset    1 "), " ")
  expect_equal(strip_query("a offset 1"), "a ")
  expect_equal(strip_query("limit 1 offset 1"), " ")
  expect_equal(strip_query("a limit 1 offset 1"), "a  ")
  expect_equal(strip_query("offset 1 limit 1"), " ")
  expect_equal(strip_query("a offset 1 limit 1"), "a  ")
  expect_equal(strip_query("a offset 1 limit 1 order by b"), "a   order by b")
})
