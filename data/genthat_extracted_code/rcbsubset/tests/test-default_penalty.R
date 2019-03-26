library(rcbsubset)
context('Ensuring default penalties behave properly')



set.seed(2018 - 5 - 16)

dist.mat <- matrix(100*(runif(10*30)),nrow = 10)

test_that('Default penalties do not exclude more than absolutely necessary', {
	match.out <- rcbsubset(dist.mat, exclude.penalty = NULL) 	
	expect_equal(nrow(match.out$matches), nrow(dist.mat))
})
