# SVN revision:   
# Date of last change: 2017-08-24
# Last changed by: csweetland
# 
# Original author: ccampbell
# Copyright Activinsights, Cambridge UK 2013-2017
###############################################################################

context("summary statistics")

###############################################################################

test_that("GENEAratio", {
    
    Freq <- 100
    
    # test 1
    expect_error(GENEAratio(principals = c(0.1, 3.2, 0.3, 0.0, 0.2)), 
        regexp = "object 'Freq' not found")
    
    # test 2
    expect_that(GENEAratio(principals = c(0.1, 3.2, 0.3, 0.0, 0.2), nfr = 1), equals(Inf))
    
    # test 3
    expect_that(GENEAratio(principals = c(26, 0.1, 3.2, 0.3, 0.0, 0.2), nfr = 1), equals(5))
    
})


test_that("GENEAcount", {
    
    # test 1
    expect_that(GENEAcount(2:4), equals(1.5))
    
    # test 2
    expect_that(GENEAcount(integer(0)), equals(0))
    
})


test_that("GENEAskew", {
    
    # test 1
    expect_that(GENEAskew(1:10), equals(0))
    
    # test 2
    expect_that(GENEAskew((1:10)^2), equals(0.568676028782))
    
    # test 3
    expect_that(GENEAskew((1:10)^0.5), equals(-0.396504161832))
    
})
