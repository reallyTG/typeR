context("calc_metrics")

test_that("calc_metrics works", {
    # create data
    set.seed(257)
    SIZE <- 15
    condition <- as.factor(c(rep("control", 2 * SIZE), rep("treatment", SIZE)))
    covariate <- c(rnorm(2 * SIZE), rnorm(SIZE, 1, 2))
    # run matching
    halting_test <- t_halt
    tiebreaker <- ad_halt
    is.in <- match_groups(condition, covariate, halting_test, print_info = FALSE)
    # calculate metrics
    expect_silent(calc_metrics(is.in, condition, covariate, halting_test,
                               tiebreaker = tiebreaker))
})
