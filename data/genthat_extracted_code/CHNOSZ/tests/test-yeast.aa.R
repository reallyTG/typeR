context("yeast.aa")

test_that("unmatched proteins produce a message and NA row", {
  expect_message(yeast.aa(c("YLR027C", "XXX")), "XXX was not matched")
  expect_equal(nrow(yeast.aa(c("YLR027C", "XXX"))), 2)
})

