context("Coherence")

test_that("Metacommunity and Coherence agree", {
	set.seed(100);
	test <- matrix(rbinom(100,1,0.5), ncol=10)
	mc.test <- Metacommunity(test, sims=100, method='swap')
  coh.test <- Coherence(test, sims=100, method='swap')
	expect_equal(mc.test$Coherence$stat[1], 
    coh.test$stat[1])
})
