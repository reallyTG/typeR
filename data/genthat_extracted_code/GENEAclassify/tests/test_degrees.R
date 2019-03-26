# SVN revision:   
# Date of last change: 2017-08-24
# Last changed by: csweetland
# 
# Original author: ccampbell
# Copyright Activinsights, Cambridge UK 2013-2017
###############################################################################

context("degrees")

###############################################################################

test_that("degrees", {
    
    d1 <- matrix(c(100, 101, -0.79, -0.86, -0.17, -0.14, 0.53, 0.46), nrow = 2, ncol = 4)
    colnames(d1) <- c("timestamp", "x", "y", "z")
    expect_that(degrees(x = d1), equals(c(259, 253)))
    
    d2 <- matrix(c(100, 101, 102, 103, 104,
        -0.79, -0.36, 0.03, -0.16, 0.54,
        -0.27, -0.14, -0.25, -0.10, 0.21,
        -0.53, -0.46, 0.13, 0.97, 0.43), nrow = 5, ncol = 4)
    colnames(d2) <- c("timestamp", "x", "y", "z")
    expect_that(degrees(x = d2), equals(c(191, 173, -32, 306, 6)))
    
    rm(list = c("d1", "d2"))
})
