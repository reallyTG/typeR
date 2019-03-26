context("random.spd")

test_that("random.spd runs as expected", {
    expect_error(random.spd(1))
    expect_error(random.spd(2), NA)
})

check_evals <- function(in_evals, check_evals, nnode){
    test_evals <- in_evals
    out_evals <- eigen(random.spd(nnode, test_evals))$values
    err <- sum(abs(out_evals - check_evals))
    err < zero_threshold()
}

test_that("random.spd gives correct results", {
    expect_true(check_evals(1, c(1,0,0), 3))
    expect_true(check_evals(c(pi, exp(1)), c(pi, exp(1),0,0,0), 5))
    expect_true(check_evals(5:1, c(5:1,0,0,0,0,0), 10))
    expect_true(check_evals(5:1, 5:1, 5))
})
