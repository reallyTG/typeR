context("compare_ldamatch_outputs")

test_that("compare_ldamatch_outputs works", {
    # turn off output messages
    set_param("PRINT_INFO", FALSE)
    # create data
    set.seed(257)
    SIZE <- 15
    condition <- as.factor(c(rep("control", 2 * SIZE), rep("treatment", SIZE)))
    covariate1 <- c(rnorm(2 * SIZE), rnorm(SIZE, 1, 2))
    halting_test <- t_halt
    is.in1 <- match_groups(condition, covariate1, halting_test, method = "heuristic1")
    is.in2 <- match_groups(condition, covariate1, halting_test, method = "heuristic2")
    # check if we get the expected result
    cmp_heuristic1_to_heuristic2 <- compare_ldamatch_outputs(
        is.in1, is.in2, condition, covariate1, halting_test)
    expect_lt(cmp_heuristic1_to_heuristic2, 0)
})
