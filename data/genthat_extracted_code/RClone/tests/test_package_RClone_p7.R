context("RClone Package Global Test, suite")

test_that("internal functions of GenClone are OK", {

	skip_on_cran()

	#data(posidonia)
	#data(coord_posidonia)
	#res_tot <- GenClone(posidonia, coords = coord_posidonia) #Too long

	#expect_equal(unlist(res_tot[1,1]), 40) #counts N #Change on GenClone
	#expect_equal(unlist(res_tot[1,2]), "MLG") #detects no MLL
	#expect_equal(unlist(res_tot[1,3]),  28) #MLG_list works
	#expect_equal(unlist(res_tot[1,4]),  4.142857, tolerance  = 0.000001) #freq_all works
	#expect_equal(unlist(res_tot[1,6]),  0.05076926, tolerance  = 0.0000001) #Fis works
	#expect_equal(unlist(res_tot[1,8]),  0.02568129, tolerance  = 0.0000001) #double-test Fis
	#expect_equal(unlist(res_tot[1,10]),  0.6923077) #clonal_index works
	#expect_equal(unlist(res_tot[1,24]),  33.91304, tolerance  = 0.00001) #double-test clonal_index
	#expect_equal(unlist(res_tot[1,11]),  1.180756, tolerance  = 0.0000001) #Pareto_index works
	#expect_equal(unlist(res_tot[1,12]),  0.001230855, tolerance  = 0.0000001) #autocorrelation case 1 works
	#expect_equal(unlist(res_tot[1,14]),  0.0012436, tolerance  = 0.00001) #autocorrelation case 2 works
	#expect_equal(unlist(res_tot[1,16]),  0.0007693264) #autocorrelation case 3 works
	#expect_equal(unlist(res_tot[1,18]),  0.0008031684) #autocorrelation case 4 works
	
	#expect_equal(res_tot[1,1], "40") #counts N #Too long
	#expect_equal(res_tot[1,2], "MLG") #detects no MLL
	#expect_equal(res_tot[1,3],  "28") #MLG_list works
	#expect_equal(as.numeric(res_tot[1,4]),  4.142857, tolerance  = 0.000001) #freq_all works
	#expect_equal(as.numeric(res_tot[1,6]),  0.05076926, tolerance  = 0.0000001) #Fis works
	#expect_equal(as.numeric(res_tot[1,8]),  0.02568129, tolerance  = 0.0000001) #double-test Fis
	#expect_equal(as.numeric(res_tot[1,10]),  0.6923077) #clonal_index works
	#expect_equal(as.numeric(res_tot[1,24]),  33.91304, tolerance  = 0.00001) #double-test clonal_index
	#expect_equal(as.numeric(res_tot[1,11]),  1.180756, tolerance  = 0.0000001) #Pareto_index works
	#expect_equal(as.numeric(res_tot[1,12]),  0.001230855, tolerance  = 0.0000001) #autocorrelation case 1 works
	#expect_equal(as.numeric(res_tot[1,14]),  0.0012436, tolerance  = 0.00001) #autocorrelation case 2 works
	#expect_equal(as.numeric(res_tot[1,16]),  0.0007693264) #autocorrelation case 3 works
	#expect_equal(as.numeric(res_tot[1,18]),  0.0008031684) #autocorrelation case 4 works

})
