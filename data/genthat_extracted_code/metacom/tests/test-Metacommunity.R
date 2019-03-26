context("Metacommunity")

test_that("Metacommunity returns a thing", {
	set.seed(100);
	test <- matrix(rbinom(100,1,0.5), ncol=10)
	mc.test <- Metacommunity(test, sims=100, method='swap')
	expect_equal(length(mc.test), 4)
  expect_equal(nrow(mc.test[[1]]), nrow(test))
})
