# SVN revision:   
# Date of last change: 2017-08-24
# Last changed by: csweetland
# 
# Original author: ccampbell
# Copyright Activinsights, Cambridge UK 2013-2017
###############################################################################

context("classify based on activity")

###############################################################################

test_that("classifyGENEA", {
    
    expect_error(classifyGENEA(), regexp = "testfile and newdata are missing but one should be provided")
    
    ft <- features(trainingFit)
    
    expect_equal(object = ft, 
        expected = c("UpDown.sd", "Principal.Frequency.median", "Segment.Duration", 
            "Principal.Frequency.mad", "Degrees.sd"))
    
    d2 <- as.data.frame(matrix(seq_along(ft), ncol = length(ft), dimnames = list(1, ft)))
    
    t2 <- classifyGENEA(newdata = d2, verbose = FALSE)
    
    expect_that(as.character(t2$Class), equals("Seated Desk"))
    
    expect_that(t2$p.Class, equals(0.266666666667))
    
    rm(list = c("ft", "d2", "t2"))
})
