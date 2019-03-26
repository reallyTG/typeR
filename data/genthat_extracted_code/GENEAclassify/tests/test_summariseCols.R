# SVN revision:   
# Date of last change: 2017-08-24
# Last changed by: csweetland
# 
# Original author: ccampbell
# Copyright Activinsights, Cambridge UK 2013-2017
###############################################################################

context("summarise columns")

###############################################################################

test_that("summariseCols", {
    
    summariseCols <- GENEAclassify:::summariseCols
    
    s1 <- try(summariseCols(colfun = matrix(NA, ncol = 2, nrow = 0)), silent = TRUE)
    
    expect_that(paste(s1), equals("Error in summariseCols(colfun = matrix(NA, ncol = 2, nrow = 0)) : \n  dataCols must be a character matrix with two columns\n"))
    
    s2 <- try(summariseCols(colfun = matrix(1:4, ncol = 2)), silent = TRUE)
    
    expect_that(paste(s2), equals("Error in summariseCols(colfun = matrix(1:4, ncol = 2)) : \n  dataCols must be a character matrix with two columns\n"))
    
    s3 <- try(summariseCols(colfun = c("Step", "median")), silent = TRUE)
    
    expect_that(paste(s3), equals("Error in summariseCols(colfun = c(\"Step\", \"median\")) : \n  dataCols must be a character matrix with two columns\n"))
    
    A <- split(1:10, rep(1, each = 10))
    
    dataCols <- matrix(c("A", "mean", 
            "A", "median", 
   	        "A", "var"), ncol = 2, byrow = TRUE)
    
    s4 <- summariseCols(colfun = dataCols)
    
    expect_that(s4, equals(data.frame("A.mean" = 5.5, "A.median" = 5.5, "A.var" = 9.16666666667)))
    
    A <- split(1:10, rep(1:2, each = 5))
    
    s5 <- summariseCols(colfun = dataCols)
    
    expect_that(s5, equals(data.frame("A.mean" = c(3, 8), "A.median" = c(3, 8), "A.var" = 2.5)))
    
    s6 <- try(summariseCols(colfun = matrix(c("A", "blah"), nrow = 1, ncol = 2)), silent = TRUE)
    
    expect_that(paste(s6), equals("Error in summariseCols(colfun = matrix(c(\"A\", \"blah\"), nrow = 1, ncol = 2)) : \n  functions named in colfun do not exist\n"))
    
    s7 <- try(summariseCols(colfun = matrix(c("B", "sd"), nrow = 1, ncol = 2)), silent = TRUE)
    
    expect_that(paste(s7), equals("Error in summariseCols(colfun = matrix(c(\"B\", \"sd\"), nrow = 1, ncol = 2)) : \n  variables named in colfun do not exist\n"))
    
    rm(list = c("A", paste0("s", 1:7)))
})
