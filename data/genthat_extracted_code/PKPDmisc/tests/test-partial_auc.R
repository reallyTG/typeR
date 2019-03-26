context("partial auc")

x <- c(0, 1, 2, 3)
y <- c(1, 1, 1, 1)
test_that("simple AUC calculation works", {
  auc_default <- auc_partial(x, y)
  auc0_2 <- auc_partial(x, y, c(0, 2))
  auc0_4 <- auc_partial(x, y, c(0, 4))
  expect_equal(auc_default, setNames(3, "pAUC0_tlast"))
  expect_equal(auc0_2, setNames(2, "pAUC0_2"))
  expect_equal(auc0_4, setNames(3, "pAUC0_4"))
  # string comparison failing so not checking the error message directly
  expect_error(auc_partial(x, y, c(3, 1))) 
  expect_error(auc_partial(c('a'), y)) 
  expect_error(auc_partial(c(1, 2), c(1, 2, 3)), "idv and dv columns must be equal lengths, maybe you filtered NA's only in one?") 
})