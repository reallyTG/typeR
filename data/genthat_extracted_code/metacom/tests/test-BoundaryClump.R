context("BoundaryClump")

test_that("Metacommunity and BoundaryClump agree", {
	set.seed(1000);
	test <- matrix(rbinom(100,1,0.5), ncol=10)
	mc.test <- Metacommunity(test, sims=10, method='swap')
	bc.test <- BoundaryClump(test)
	expect_equal(mc.test$Boundary$stat[1], 
    bc.test$stat[1])
})
