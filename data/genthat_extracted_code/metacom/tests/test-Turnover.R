context("Turnover")

test_that("Metacommunity and Turnover agree", {
	set.seed(100);
	test <- matrix(rbinom(100,1,0.5), ncol=10)
	mc.test <- Metacommunity(test, sims=100, method='r1')
  turn.test <- Turnover(test, sims=100, method='EMS')
	expect_equal(mc.test$Turnover$stat[1], 
    turn.test$stat[1])
})
