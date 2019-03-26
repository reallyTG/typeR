# Tests that likelihood calculation is the same under solve and cholesky 
# decomposition methods
library(deGradInfer)

set.seed(10)

context("Likelihood Comparison")

# Four saved test cases
for(test.case.i in 1:4) {
  load(paste0('testing_state_LV_', test.case.i, '.rda'))
  
  auxVars$Kchanged = species
  
  LL = calculateLogLikelihoodMCMC(params, gpFit, X, lambda, timePoints, 
                                  auxVars, species, chain)
                                      
  test_that("Likelihood is unchanged", {
    skip_on_cran()
    expect_equal_to_reference(LL, paste0('ll_', test.case.i, '.rds'))
  })
}

