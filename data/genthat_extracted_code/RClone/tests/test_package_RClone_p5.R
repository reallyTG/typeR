context("Spatial Functions of RClone")

test_that("the kinship functions work", {

	skip_on_cran()
	
	data(posidonia)
	
	prev1 <- kinship_Loiselle_core(posidonia)
	prev2 <- kinship_Ritland_core(posidonia)
	prev3 <- kinship_Loiselle_core(posidonia, haploid = TRUE)
	prev4 <- kinship_Ritland_core(posidonia, haploid = TRUE)
	
	expect_that(prev1, is_a("dist"))
	expect_that(prev2, is_a("dist"))
	expect_that(prev3, is_a("dist"))
	expect_that(prev4, is_a("dist"))
	expect_equal(length(prev1), 780)
	expect_equal(length(prev2), 780)
	
	res1 <- kinship_Loiselle(posidonia)
	res2 <- kinship_Ritland(posidonia)
	res3 <- kinship_Loiselle(posidonia, vecpop = rep(1, 40))
	res4 <- kinship_Ritland(posidonia, vecpop = rep(1, 40))
	
	expect_that(res1, is_a("dist"))
	expect_that(res2, is_a("dist"))
	expect_that(res3, is_a("list"))
	expect_that(res4, is_a("list"))
	expect_equal(length(res1), 780)
	expect_equal(length(res2), 780)
	expect_equal(res1[250], -0.1984939, tolerance = 0.000001)
	expect_equal(res2[250], -0.1029367, tolerance = 0.000001)
	
	expect_that(kinship_Loiselle(posidonia, vecpop = 1), throws_error(""))
	expect_that(kinship_Ritland(posidonia, vecpop = 1), throws_error(""))
		
})


test_that("the autocorrelation function works", {
	
	skip_on_cran()
	
	data(posidonia)
	data(coord_posidonia)
	
	prev1 <- red_MLL(posidonia, MLG_list(posidonia))
	prev2 <- red_MLL_mod(posidonia, MLG_list(posidonia))
	prev3 <- autocorrelation_core(posidonia, Loiselle = TRUE, coords = coord_posidonia)
		
	expect_that(prev3, is_a("list"))
	expect_that(prev3[[1]], is_a("data.frame"))
	expect_equal(length(prev1), 28)
	expect_equal(length(prev2), 28)
	expect_equal(length(prev3), 5)
	expect_equal(ncol(prev3[[1]]), 6)
	
	res1 <- autocorrelation(posidonia, Loiselle = TRUE, coords = coord_posidonia, vecdist = c(0,10,15,20,30,50,70,76.0411073), graph = TRUE)
	res2 <- autocorrelation(posidonia, Loiselle = TRUE, coords = coord_posidonia, genet = TRUE, central_coords = TRUE, d = 7, class1 = TRUE)
	res3 <- autocorrelation(posidonia, Loiselle = TRUE, coords = coord_posidonia, genet = TRUE, weighted = TRUE, d = 7, class2 = TRUE, export = TRUE)
	res4 <- autocorrelation(posidonia, Ritland = TRUE, coords = coord_posidonia, nbrepeat = 100)
	res5 <- autocorrelation(posidonia, Ritland = TRUE, coords = coord_posidonia, genet = TRUE, random_unit = TRUE, d = 10, class1 = TRUE)
	res6 <- autocorrelation(posidonia, Loiselle = TRUE, coords = coord_posidonia, nbrepeat = 100)
	res7 <- graph_autocorrelation(res6$Class_distance_results, res6$Class_kinship_results)
	res8 <- autocorrelation(posidonia, Ritland = TRUE, coords = coord_posidonia, nbrepeat = 100, vecpop = rep(1, 40), export = TRUE)
	res9 <- autocorrelation(posidonia, Loiselle = TRUE, coords = coord_posidonia, nbrepeat = 100, listMLL = MLG_list(posidonia), genet = TRUE, random_unit = TRUE)
	
	expect_that(res1, is_a("list"))
	expect_that(res2, is_a("list"))
	expect_that(res3, is_a("list"))
	expect_that(res4, is_a("list"))
	expect_that(res5, is_a("list"))
	expect_that(res6, is_a("list"))
	expect_that(res8, is_a("list"))
	expect_that(res9, is_a("list"))
	expect_equal(length(res2), 5)
	expect_equal(length(res4), 7)
	expect_equal(length(res7), 0)
	expect_equal(length(res8), 1)
	expect_equal(nrow(res3[[1]]), 7)
	expect_equal(nrow(res4[[1]]), 10)
	expect_equal(res1[[1]][5,5], 209) #nb pairs
	expect_equal(res2[[1]][5,5], 37)
	expect_equal(res3[[1]][5,5], 111)
	expect_equal(res4[[1]][5,5], 121)
	expect_equal(apply(res1[[1]], 2, mean)[[6]], 0.02745574, tolerance = 0.000001) #mean kinship
	expect_equal(apply(res2[[1]], 2, mean)[[6]], -0.008151565, tolerance = 0.000001)
	expect_equal(apply(res3[[1]], 2, mean)[[6]], 0.001107538, tolerance = 0.000001)
	expect_equal(apply(res4[[1]], 2, mean)[[6]], -0.01602399, tolerance = 0.000001)
	
	expect_that(autocorrelation(posidonia, coords = coord_posidonia), throws_error(""))
	expect_that(autocorrelation(posidonia, coords = coord_posidonia, Loiselle = TRUE, genet = TRUE), throws_error(""))
	expect_that(autocorrelation(posidonia, coords = coord_posidonia, Loiselle = TRUE, listMLL = MLG_list(posidonia), genet = TRUE), throws_error(""))
	expect_that(autocorrelation(posidonia, coords = coord_posidonia, Loiselle = TRUE, listMLL = 1), throws_error(""))
	expect_that(autocorrelation(posidonia, coords = coord_posidonia, Loiselle = TRUE, vecpop = 1), throws_error(""))
		
})


test_that("the sub-functions work", {
	
	skip_on_cran()
	
	data(posidonia)
	
	res1 <- id_clonal(posidonia)
	res2 <- id_clonal_mod(posidonia)
	res3 <- id_clonal_MLL(posidonia, MLG_list(posidonia))
	res4 <- id_clonal_mod_MLL(posidonia, MLG_list(posidonia))
	
	expect_that(res1, is_a("matrix"))
	expect_that(res2, is_a("matrix"))
	expect_that(res3, is_a("matrix"))
	expect_that(res4, is_a("matrix"))
	expect_equal(nrow(res1), 40)
	expect_equal(nrow(res2), 40)
	expect_equal(ncol(res3), 40)
	expect_equal(ncol(res4), 40)
	expect_equal(res1[7,3], 0) #id_clonal
	expect_equal(res3[7,3], 0) #id_clonal too
	expect_equal(res2[7,3], 1) #opposite of id_clonal
	expect_equal(res4[7,3], 1) #opposite of id_clonal too
	
	data(coord_posidonia)
	
	res5 <- nearest_unit(coord_posidonia)
	
	expect_that(res5, is_a("matrix"))
	expect_equal(nrow(res5), 28)
	expect_equal(ncol(res5), 4)			
	expect_equal(round(res5[21,4], digits = 5)[[1]], round(2.061553, digits = 5), tolerance = 0.0001)
	
	expect_that(id_clonal_MLL(posidonia, listMLL = 1), throws_error(""))
	expect_that(id_clonal_mod_MLL(posidonia, listMLL = 1), throws_error(""))
	
})
	
test_that("the clonal subrange function works", {
	
	skip_on_cran()
	
	data(posidonia)
	data(coord_posidonia)
	
	prev <- clonal_sub_core(posidonia, coord_posidonia)
	
	expect_that(prev, is_a("list"))
	expect_equal(length(prev), 2)
	
	res1 <- clonal_sub(posidonia, coord_posidonia)
	res2 <- clonal_sub(posidonia, coord_posidonia, class1 = TRUE, d = 7)
	res3 <- clonal_sub(posidonia, coord_posidonia, vecdist = c(0,10,15,20,30,50,70,76.0411073))	
	res4 <- clonal_sub(posidonia, coord_posidonia, listMLL = MLG_list(posidonia))
	res5 <- clonal_sub(posidonia, coord_posidonia, vecpop = rep(1, 40))
	res6 <- clonal_sub(posidonia, coord_posidonia, class2 = TRUE, d = 8)
	
	expect_that(res1, is_a("list"))
	expect_that(res2, is_a("list"))
	expect_that(res3, is_a("list"))
	expect_that(res4, is_a("list"))
	expect_that(res5, is_a("list"))
	expect_that(res6, is_a("list"))
	expect_that(res1[[2]], is_a("matrix"))
	expect_that(res2[[2]], is_a("matrix"))
	expect_equal(length(res1), 2)
	expect_equal(length(res2), 2)
	expect_equal(nrow(res1[[2]]), 10)
	expect_equal(nrow(res2[[2]]), 7)
	expect_equal(res2[[1]], 11.6619, tolerance = 0.0001)
	
	expect_that(clonal_sub(posidonia, coord_posidonia, listMLL = 1), throws_error(""))
	expect_that(clonal_sub(posidonia, coord_posidonia, vecpop = 1), throws_error(""))
	
})


test_that("the aggregation function works", {
	
	data(posidonia)
	data(coord_posidonia)
	
	prev <- agg_index_core(posidonia, coord_posidonia)
	
	expect_that(prev, is_a("list"))
	expect_equal(length(prev), 2)
	
	res1 <- agg_index(posidonia, coord_posidonia, bar = TRUE)
	res2 <- agg_index(posidonia, coord_posidonia, listMLL = MLG_list(posidonia))
	res3 <- agg_index(posidonia, coord_posidonia, vecpop = rep(1, 40))
	
	expect_that(res1, is_a("list"))
	expect_that(res2, is_a("list"))
	expect_that(res3, is_a("list"))
	expect_that(res1[[1]], is_a("matrix"))
	expect_equal(nrow(res1[[1]]), 1)
	expect_equal(ncol(res1[[1]]), 3)
	expect_equal(round(res1[[1]][1,1], digits = 5)[[1]], round(0.2272127, digits = 5), tolerance = 0.00001)
	
	expect_that(agg_index(posidonia, coord_posidonia, vecpop = 1), throws_error(""))
	expect_that(agg_index(posidonia, coord_posidonia, MLL = 1), throws_error(""))
	
})


test_that("the edge effect function works", {
	
	data(posidonia)
	data(coord_posidonia)
	
	prev <- edge_effect_core(posidonia, coords = coord_posidonia, center = c(40,10))
	
	expect_that(prev, is_a("list"))
	expect_equal(length(prev), 2)
	
	res1 <- edge_effect(posidonia, coords = coord_posidonia, center = c(40,10))
	res2 <- edge_effect(posidonia, coords = coord_posidonia, center = c(40,10), vecpop = rep(1, 40))
	res3 <- edge_effect(posidonia, coords = coord_posidonia, center = c(40,10), listMLL = MLG_list(posidonia), bar = TRUE)
	
	expect_that(res1, is_a("list"))
	expect_that(res2, is_a("list"))
	expect_that(res3, is_a("list"))
	expect_that(res1[[1]], is_a("data.frame"))
	expect_equal(nrow(res1[[1]]), 1)
	expect_equal(ncol(res1[[1]]), 3)
	expect_equal(round(res1[[1]][1,1], digits = 5)[[1]], round(0.07786722, digits = 5), tolerance = 0.00001)
	
	expect_that(edge_effect(posidonia, coord_posidonia, center = c(40,10), vecpop = 1), throws_error(""))
	expect_that(edge_effect(posidonia, coord_posidonia, center = c(40,10), listMLL = 1), throws_error(""))
	
})
