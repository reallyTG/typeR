# SVN revision:   
# Date of last change: 2017-08-24
# Last changed by: csweetland
# 
# Original author: ccampbell
# Copyright Activinsights, Cambridge UK 2013-2017
###############################################################################

context("import datasets")

###############################################################################

test_that("getGENEAsegments", {
    
    t1 <- try(getGENEAsegments(c("a", "b")), silent = TRUE)
    
    expect_that(t1, is_a("try-error"))
    
    expect_that(paste(t1), equals("Error in getGENEAsegments(c(\"a\", \"b\")) : testfile not found: a, b\n"))
    
    cat("test\n", file = "delete-me.txt")
    
    t2 <- try(getGENEAsegments(c("delete-me.txt", "b")), silent = TRUE)
    
    expect_that(t2, is_a("try-error"))
    
    expect_that(paste(t2), equals("Error in getGENEAsegments(c(\"delete-me.txt\", \"b\")) : \n  testfile not found: b\n"))
    
    t3 <- try(getGENEAsegments("delete-me.txt"), silent = TRUE)

    expect_that(t3, is_a("try-error"))
    
    expect_that(paste(t3), equals("Error in getGENEAsegments(\"delete-me.txt\") : testfile refers to 0 files\n"))
    
    unlink("delete-me.txt")
    
    
    
    rm(list = c("t1", "t2", "t3"))
})
