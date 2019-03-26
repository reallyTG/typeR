# Date of last change: 2017-08-24
# Last changed by: csweetland
# 
# Original author: ccampbell
# Copyright Activinsights, Cambridge UK 2013-2017
###############################################################################

context("step counter")

###############################################################################

test_that("doRunningMean", {
    
    # test 1
    d1 <- doRunningMean(xpz = c(-1.31, -1.29, 1.20))
    expect_that(sum(d1, na.rm = TRUE), equals(-6.153333333333))
    
    xx <- 1:10000
    
    # test 2
    d2 <- doRunningMean(xpz = sin(0.01 * xx))
    expect_that(sum(d2[, "zeroCross"], na.rm = TRUE), equals(31))
    
    # test 3
    d3 <- doRunningMean(xpz = sin(0.01 * xx) + 2 * cos(0.001 * xx))
    expect_that(sum(d2[, "zeroCross"], na.rm = TRUE), equals(31))
    
    # test 4
    d4 <- doRunningMean(xpz = cos(1:20), ks = 3, kl = 5, cw = 8)
    expect_that(sum(d4, na.rm = TRUE), equals(18.63775953692))
})
