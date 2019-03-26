context("Genetic Distance Functions of RClone")

test_that("the genet_dist functions work", {

	data(posidonia)
	
	prev1 <- genet_dist_core(posidonia)
	prev2 <- genet_dist_sim_core(posidonia, nbrepeat = 10)
	prev3 <- genet_dist_core(posidonia, haploid = TRUE)
	prev4 <- genet_dist_core(posidonia, haploid = TRUE, manh = TRUE)
	prev5 <- genet_dist_core(posidonia, haploid = TRUE, manh_w = TRUE)
	
	expect_that(prev1[[1]], is_a("dist"))
	expect_that(prev2[[1]], is_a("dist"))
	expect_that(prev3[[1]], is_a("dist"))
	expect_that(prev4[[1]], is_a("dist"))
	expect_that(prev5[[1]], is_a("dist"))
	expect_equal(length(prev1[[1]]), 378)
	expect_equal(length(prev2[[1]]), 45)
		
	res1 <- genet_dist(posidonia, export = TRUE)
	res1b <- genet_dist(posidonia, vecpop = rep(1, 40), export = TRUE)
	res1c <- genet_dist(posidonia, alpha2 = 2, export = TRUE)
	res1d <- genet_dist(posidonia, vecpop = rep(1, 40), export = TRUE, alpha2 = 2)
	res2 <- genet_dist(posidonia, manh = TRUE)
	res3 <- genet_dist(posidonia, manh_w = TRUE)
	res4 <- genet_dist(posidonia, graph = TRUE)
	res4b <- genet_dist(posidonia, graph = TRUE, alpha1 = 0.05, breaking = 2)
	res4c <- genet_dist(posidonia, graph = TRUE, alpha2 = 2)
	
	expect_that(res1[[1]], is_a("dist"))
	expect_that(res1b[[1]], is_a("list"))
	expect_that(res1c[[1]], is_a("dist"))
	expect_that(res1d[[1]], is_a("list"))
	expect_that(res2[[1]], is_a("dist"))
	expect_that(res3[[1]], is_a("dist"))
	expect_that(res4[[1]], is_a("dist"))
	expect_that(res4b[[1]], is_a("dist"))
	expect_that(res4c[[1]], is_a("dist"))
	expect_equal(res1[[1]][236], 12)
	expect_equal(res2[[1]][236], 58)
	expect_equal(res3[[1]][236], 8.285714, tolerance = 0.00001)
	
	res5 <- genet_dist(posidonia, alpha1 = 0.05)
	res6 <- genet_dist(posidonia, alpha2 = 1)
	res6b <- genet_dist(posidonia, vecpop = rep(1, 40), alpha1 = 0.05)
	res6c <- genet_dist(posidonia, vecpop = rep(1, 40), alpha2 = 2)
	res6d <- genet_dist(posidonia, alpha1 = 0)
	res6e <- genet_dist(posidonia, alpha2 = 0)
	
	expect_that(res5, is_a("list"))
	expect_that(res6, is_a("list"))
	expect_that(res6b[[1]], is_a("list"))
	expect_that(res6c[[1]], is_a("list"))
	expect_that(res6d[[1]], is_a("dist"))
	expect_that(res6e[[1]], is_a("dist"))
	expect_equal(length(res5), 4)
	expect_equal(length(res6), 4)
	expect_equal(res5[[4]], 3)
	expect_equal(res6[[4]], 1)
	
	expect_that(genet_dist(posidonia, alpha1 = 0.05, alpha2 = 2), throws_error(""))
	expect_that(genet_dist(posidonia, alpha1 = 2), throws_error(""))
	expect_that(genet_dist(posidonia, alpha2 = -1), throws_error(""))
	expect_that(genet_dist(posidonia, alpha2 = 13), throws_error(""))
	expect_that(genet_dist(posidonia, vecpop = 1), throws_error(""))
	expect_that(genet_dist(posidonia, vecpop = rep(1, 40), alpha2 = c(2, 2)), throws_error(""))
	expect_that(genet_dist(posidonia, vecpop = rep(1, 40), alpha1 = c(0.05, 0.05)), throws_error(""))
	
	res7 <- genet_dist_sim(posidonia, nbrepeat = 10, export = TRUE)
	res7 <- genet_dist_sim(posidonia, nbrepeat = 10)
	res8 <- genet_dist_sim(posidonia, manh = TRUE, nbrepeat = 10)
	res9 <- genet_dist_sim(posidonia, manh_w = TRUE, nbrepeat = 10)
	res10 <- genet_dist_sim(posidonia, nbrepeat = 10, haploid = TRUE)
	res11 <- genet_dist_sim(posidonia, nbrepeat = 10, genet = TRUE)
	res12 <- genet_dist_sim(posidonia, nbrepeat = 10, vecpop = rep(1, 40), export = TRUE)
	res12 <- genet_dist_sim(posidonia, nbrepeat = 10, vecpop = rep(1, 40))
	
	expect_that(res7[[1]], is_a("dist"))
	expect_that(res8[[1]], is_a("dist"))
	expect_that(res9[[1]], is_a("dist"))
	expect_that(res10[[1]], is_a("dist"))
	expect_that(res11[[1]], is_a("dist"))
	expect_that(res12[[1]], is_a("list"))
	expect_that(genet_dist_sim(posidonia, nbrepeat = 10, vecpop = 1), throws_error(""))
	
	
	res13 <- genet_dist(posidonia, alpha1 = 0.05)
	res14 <- genet_dist(posidonia, alpha1 = 0)
	res15 <- genet_dist(posidonia, alpha2 = 0)
	
	expect_equal(graph_genet_dist(res13[[1]], breaking = 2, tab_sort = res13[[3]], indic = 2, alpha1 = 0.05), NULL)
	expect_equal(graph_genet_dist(res13[[1]], breaking = NULL, tab_sort = res13[[3]], indic = 2, alpha2 = 2), NULL)
	expect_that(res14[[1]], is_a("dist"))
	expect_that(res15[[1]], is_a("dist"))
	
})


test_that("the MLL functions work", {

	skip_on_cran()

	data(posidonia)
	
	prev1 <- MLL_generator_core(posidonia, alpha2 = 1)
	prev2 <- MLL_generator2_core(genet_dist(posidonia, alpha1 = 0.05)[[2]], MLG_list(posidonia))
	
	expect_that(prev1, is_a("list"))
	expect_that(prev2, is_a("list"))
	expect_equal(length(prev1), 23)
	expect_equal(length(prev2), 13)
	
	res1 <- MLL_generator(posidonia, alpha1 = 0.05)
	res2 <- MLL_generator(posidonia, alpha2 = 1)
	res3 <- MLL_generator(posidonia)
	res4 <- MLL_generator(posidonia, vecpop = rep(1, 40), alpha1 = 0.05)
	res5 <- MLL_generator(posidonia, vecpop = rep(1, 40), alpha2 = 2)
	
	expect_that(res1, is_a("list"))
	expect_that(res2, is_a("list"))
	expect_that(res3, is_a("list"))
	expect_that(res4, is_a("list"))
	expect_that(res5, is_a("list"))
	expect_equal(length(res1), 13)
	expect_equal(length(res2), 23)
	
	expect_that(MLL_generator(posidonia, vecpop = 1), throws_error(""))
	expect_that(MLL_generator(posidonia, vecpop = rep(1, 40), alpha1 = c(0.05, 0.05)), throws_error(""))
	expect_that(MLL_generator(posidonia, vecpop = rep(1, 40), alpha2 = c(2, 2)), throws_error(""))
	
	res6 <- MLL_generator2(genet_dist(posidonia, alpha2 = 1)[[2]], MLG_list(posidonia))
	res7 <- genet_dist(posidonia, alpha1 = 0.05)
	res8 <- MLL_generator2(res7[2], res_mlg = MLG_list(posidonia, vecpop = rep(1,40)), vecpop = rep(1,40))
	
	expect_that(res6, is_a("list"))
	expect_that(res8, is_a("list"))
	expect_equal(length(res6), 23)
	
	expect_that(MLL_generator2(res7[[2]], MLG_list(posidonia), vecpop = 1), throws_error(""))
	expect_that(MLL_generator2(res7, res_mlg = MLG_list(posidonia, vecpop = rep(1,40)), vecpop = rep(1,40)), throws_error(""))
	
})	
