context("calc_p_value")

test_that("calc_p_value works", {
    # turn off output messages
    set_param("PRINT_INFO", FALSE)
    # create data
    set.seed(257)
    SIZE <- 15
    condition <- as.factor(c(rep("control", 2 * SIZE), rep("treatment", SIZE)))
    covariate1 <- c(rnorm(2 * SIZE), rnorm(SIZE, 1, 2))
    is.in <- match_groups(condition, covariate1, t_halt)
    # check if we get any numeric result
    p <- calc_p_value(condition, covariate1, t_halt)
    expect_is(p, "numeric")
})
