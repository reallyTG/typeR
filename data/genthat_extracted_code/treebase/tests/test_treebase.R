context("treebase")

test_that("search treebase works as expected", {
 skip_on_cran()         
 tr <- search_treebase("Huelsenbeck", "author")
 expect_that(is(tr, "list"), is_true())
 expect_that(is(tr[[1]], "phylo"), is_true())
})
