context("Testing function CO")

source("test_data_generator.R")

naive_COs <- lapply(splitBy(~SAMPLE_NAME+WELL, data=test_data), function(x)CO(x, naive=TRUE))
non_naive_COs <- lapply(splitBy(~SAMPLE_NAME+WELL, data=test_data), function(x)CO(x, naive=FALSE))
######################################################

##tests
test_that("The correct number of non-empty COs", {    
    ##4 is all NAs all empty
    expect_equal(as.numeric(unlist(lapply(naive_COs, length))), c(4,4,4,0,4))
    ##4 is all NAs all empty
    expect_equal(as.numeric(unlist(lapply(non_naive_COs, length))), c(4,4,4,0,4))
})

test_that("The crossover is in the right place", {    
    ##naive
    naive_no_names <- naive_COs
    names(naive_no_names) <- NULL
    naive_expect <- list(c(0,1,0,1), c(0,0,0,1), c(0,0,0,1), c(numeric(0)), c(0,0,0,0))
    expect_identical(naive_no_names, naive_expect)
    ##non-naive
    non_naive_no_names <- non_naive_COs
    names(non_naive_no_names) <- NULL
    non_naive_expect <- list(c(0.0,1.0,0.5,0.5), c(0.0,0.0,0.5,0.5), c(0.0000000, 0.33333333, 0.333333333, 0.333333333), c(numeric(0)), c(0,0,0,0))
    expect_equal(non_naive_no_names, non_naive_expect)
})
