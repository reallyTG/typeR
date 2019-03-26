context("literature_pmid")

test_that("literature_pmid", {
	skip_on_cran()

  tt <- literature_pmid(pmid = 1)

  expect_is(tt, "list")
  expect_is(tt[[1]], "list")
  expect_equal(length(tt[[1]]), 18)
})
