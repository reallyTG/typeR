context("internal tooling")

test_that("check_uid", {
  # bad
  expect_error(check_uid("adsfadf"), 'one or more')
  expect_error(check_uid("adsfadf"), 'adsfadf')

  expect_error(check_uid(c("foo", "bar")), 'foo, bar')

  # good
  expect_null(check_uid("ELEMENT_GLOBAL.2.104470"))
  
  # if null, passes
  expect_null(check_uid(NULL))
})
