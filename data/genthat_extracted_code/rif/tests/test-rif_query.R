context("rif_query")

test_that("rif_query", {
	skip_on_cran()

  tt <- rif_query(query = "cellular")

  expect_is(tt, "list")
  expect_is(tt$clauses, "list")
  expect_equal(tt$clauses[[1]]$query, "cellular")
  expect_is(tt$clauses[[1]]$expansion, "list")
  expect_is(tt$clauses[[1]]$quoted, "logical")
  expect_is(tt$clauses[[1]]$require, "logical")
  expect_is(tt$clauses[[1]]$forbid, "logical")
  expect_match(tt$operator, "AND")
})
