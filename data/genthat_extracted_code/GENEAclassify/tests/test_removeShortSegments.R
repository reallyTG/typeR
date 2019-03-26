# SVN revision:   
# Date of last change: 2017-08-24
# Last changed by: csweetland
# 
# Original author: ccampbell
# Copyright Activinsights, Cambridge UK 2013-2017
###############################################################################

context("remove short segments")

###############################################################################

test_that("removeShortSegments", {
    
    set.seed(45265)
    tm0 <- 1001:1060
    d0 <- round(c(cumsum(runif(n = 20) * 2), 
        20:1 + rnorm(n = 20), 
        runif(n = 20) * 10))
    #c0 <- cpt.var(d0, penalty = "SIC", 
    #    pen.value = 1e-3, method = "PELT")
    #cp0 <- cpts(c0)
    cp0 <- c(5L, 7L, 13L, 26L)
    #v0 <- param.est(c0)$variance
    v0 <- c(4.3, 0, 0.966666666666667, 4.1025641025641, 15.0133689839572)
    t0 <- c(tm0[1], tm0[sort(cp0)], tm0[60])
    sdur0 <- which(diff(t0) < 10)
    
    expect_equal(
        object = GENEAclassify:::removeShortSegments(
            shortduration = sdur0, 
            changes = cp0, 
            variance = v0, 
            time = tm0), 
        expected = list(cpts = c(5, 13, 26), 
            times = c(1001, 1005, 1013, 1026, 1060), 
            duration = c(4, 8, 13, 34)))
    
    d1 <- c(54, 30, 27, 53, 100, 204, 197)
    c1 <- cpt.var(d1, penalty = "SIC", pen.value = 1e-3, method = "PELT")
    
    expect_equal(
        object = GENEAclassify:::removeShortSegments(shortduration = 1, 
            changes = integer(0), 
            variance = param.est(c1)$variance, 
            time = 0:10), 
        expected = list(cpts = integer(0), times = c(0, 10), duration = 10))
    
})
