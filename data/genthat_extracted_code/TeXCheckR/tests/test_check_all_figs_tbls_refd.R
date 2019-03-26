context("check all figs tbls refd")

test_that("Error when not refd", {
  expect_equal(figs_tbls_unrefd("./check-all-figs-tbls-refd/fig_not_refd.tex"), 
               "fig:this-lab-not-refd")
})

test_that("No error when unreferenced label isn't from tbl or fig", {
  expect_null(figs_tbls_unrefd("./check-all-figs-tbls-refd/sec_not_refd.tex"))
})

test_that("Error when not labeled", {
  expect_error(check_labels("./check-all-figs-tbls-refd/fig-not-labeled.tex"))
})

test_that("No error when commented out", {
  expect_null(figs_tbls_unrefd("./check-all-figs-tbls-refd/ok-as-fig-in-comment.tex"))
})

test_that("May be left unreferenced", {
  expect_null(figs_tbls_unrefd("./check-all-figs-tbls-refd/ok-may-be-left-unrefd.tex"))
})

test_that("Vrefrange", {
  expect_null(figs_tbls_unrefd("./check-all-figs-tbls-refd/Vrefrange.tex"))
})
