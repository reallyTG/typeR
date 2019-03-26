context("RClone Package Global Test")

test_that("the GenClone function works", {

	skip_on_cran()

	#data(posidonia)
	#data(coord_posidonia)
	
	#prev <- GenClone_core(posidonia, freq_RR(posidonia))
	
	#expect_that(prev, is_a("data.frame"))
	#expect_that(ncol(prev),  equals(24))
	
	#res_tot <- GenClone(posidonia, coords = coord_posidonia, bar = TRUE) #Too long
	#res_wc <- GenClone(posidonia) #without coordinates
	#res_mll <- GenClone(posidonia, listMLL = MLG_list(posidonia)) #MLL
	#res_hp <- GenClone(posidonia, haploid = TRUE) #haploids
	#res_rp <- GenClone(posidonia, coords = coord_posidonia, nbrepeat = 10) #repeats
	#res_nc <- GenClone(unique(posidonia)) 
	#res_vp <- GenClone(posidonia, vecpop = rep(1, 40)) #multipop

	#expect_that(res_tot, is_a("data.frame")) #Too long
	#expect_that(res_wc, is_a("data.frame"))
	#expect_that(res_mll, is_a("data.frame"))
	#expect_that(res_hp, is_a("data.frame"))
	#expect_that(res_rp, is_a("data.frame"))
	#expect_that(res_nc, is_a("data.frame"))
	#expect_that(res_vp, is_a("data.frame"))
	#expect_that(ncol(res_tot),  equals(24))
 	#expect_that(ncol(res_wc),  equals(24))
	#expect_that(sum(is.na(res_tot)),  equals(6)) #change on GenClone
	#expect_that(sum(is.na(res_wc)),  equals(10)) #change on GenClone
	#expect_that(length(which(res_tot == "NA")),  equals(6)) #Too long
	#expect_that(length(which(res_wc == "NA")),  equals(10))
	
	#expect_that(GenClone(posidonia, listMLL = 1),  throws_error(""))
	#expect_that(GenClone(posidonia, vecpop = 1),  throws_error(""))
	
	#res1 <- popsimgen(posidonia) #sub-function
	#res2 <- popsimgen(posidonia, haploid = TRUE)
	
	#expect_that(res1, is_a("data.frame"))
	#expect_that(res2, is_a("data.frame"))
	#expect_that(nrow(res1),  equals(40))
 	#expect_that(ncol(res1),  equals(14))

})


