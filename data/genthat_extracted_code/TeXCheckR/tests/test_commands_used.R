context("Commands used")

test_that("Example", {
  expect_equal(commands_used(c("A \\abc{d}", "\\def{x}")),
               c("\\abc", "\\def"))
})
