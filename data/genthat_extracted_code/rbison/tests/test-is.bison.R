context("is.bison")
	
test_that("is.bison works", {
  vcr::use_cassette("is.bison", {
    out1 <- bison(species="Bison bison", type="scientific_name", count=1)
    out2 <- bison(species="bear", type="common_name", count=1)
    
  	expect_that(out1, is_a("bison"))
  	expect_that(is.bison(out1), is_true())
  	expect_that(out2, is_a("bison"))
  	expect_that(is.bison(out2), is_true())
  })
})
