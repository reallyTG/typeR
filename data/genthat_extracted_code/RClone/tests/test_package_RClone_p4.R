context("Indices of RClone")

test_that("the clonal_index function works", {

	skip_on_cran()

	data(posidonia)
	
	prev <- clonal_index_core(posidonia)
	expect_that(prev, is_a("data.frame"))
	expect_equal(ncol(prev), 8)
	expect_equal(nrow(prev), 1)
	
	res1 <- clonal_index(posidonia)
	res2 <- clonal_index(posidonia, listMLL = MLG_list(posidonia))
	res3 <- clonal_index(unique(posidonia))
	res4 <- clonal_index(posidonia, vecpop = rep(1, 40))
	
	expect_that(res1, is_a("data.frame"))
	expect_that(res2, is_a("data.frame"))
	expect_that(res3, is_a("data.frame"))
	expect_that(res4, is_a("data.frame"))
	expect_equal(ncol(res1), 8)
	expect_equal(nrow(res1), 1)
	expect_equal(res1[1,8], 33.91304, tolerance = 0.0001)
	expect_equal(res3[1,8], NA)
	
	expect_that(clonal_index(posidonia, listMLL = 1), throws_error(""))
	expect_that(clonal_index(posidonia, vecpop = 1), throws_error(""))
	
})


test_that("the Pareto_index function works", {
	
	skip_on_cran()

	data(posidonia)
	
	prev <- Pareto_index_core(posidonia)
	expect_that(prev, is_a("list"))
	expect_equal(length(prev), 3)
	
	res1 <- Pareto_index(posidonia, graph = TRUE, export = TRUE)
	res2 <- Pareto_index(posidonia, full = TRUE)
	res3 <- Pareto_index(posidonia, listMLL = MLG_list(posidonia))
	res4 <- Pareto_index(posidonia, vecpop = rep(1, 40), export = TRUE)
	res5 <- Pareto_index(posidonia, graph = TRUE, legends = 2)
	
	expect_that(res1, is_a("list"))
	expect_that(res2, is_a("list"))
	expect_that(res3, is_a("list"))
	expect_that(res4, is_a("list"))
	expect_that(res5, is_a("list"))
	expect_that(res1[[3]], is_a("matrix"))
	expect_equal(length(res1), 3)
	expect_equal(length(res2), 4)
	expect_equal(ncol(res1[[3]]), 4)
	expect_equal(ncol(res2[[4]]), 2)
	expect_equal(res1[[1]], 1.180756, tolerance = 0.00001)
	expect_equal(res2[[2]], 2.180756, tolerance = 0.00001)
	
	expect_that(Pareto_index(posidonia, listMLL = 1), throws_error(""))
	expect_that(Pareto_index(posidonia, vecpop = 1), throws_error(""))
		
})
