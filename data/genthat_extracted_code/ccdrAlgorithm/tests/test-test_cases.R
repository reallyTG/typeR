context("Test cases")

#
# In the special case when the data and the initial guess are both zero, the result
#  of the CCDr should be _exactly_ beta_ij = 0 and sigma_j = sqrt(n) for all i and j
#
# For details, see Section 5.2 of Aragam and Zhou (2015), in particular equations
#  (33) and (34)
#

expected_rhos_value <- function(nn) sqrt(nn)

test_that("If cors = 0 and betas = 0, ouput should be all zeroes (low-dim)", {

    ### Low-dimensions
    pp <- 5
    nn <- 10
    cors <- rep(0, pp*(pp+1)/2)
    final <- ccdr_gridR(cors = cors,
                        pp = as.integer(pp), nn = as.integer(nn),
                        betas = matrix(0, nrow = pp, ncol = pp),
                        sigmas = rep(-1, pp),
                        weights = rep(1, pp*pp),
                        alpha = 10, gamma = 2, eps = 1e-4, maxIters = 10L, lambdas = 10:1, verbose = FALSE)

    check_zeroes <- check_vars <- TRUE
    for(k in seq_along(final)){
#         check_zeroes <- check_zeroes & all(get.adjacency.matrix(final[[k]]) == 0)
#         check_vars <- check_vars & isTRUE(all.equal(get.rhos(final[[k]]), rep(expected_rhos_value, pp)))

        expect_true(all(get.adjacency.matrix(final[[k]]$sbm) == 0))
        expect_true(isTRUE(all.equal(final[[k]]$sbm$sigmas, rep(expected_rhos_value(nn), pp))))
    }

#     expect_true(check_zeroes)
#     expect_true(check_vars)
})

test_that("If cors = 0 and betas = 0, ouput should be all zeroes (high-dim)", {

    ### High-dimensions
    pp <- 50
    nn <- 10
    cors <- rep(0, pp*(pp+1)/2)
    final <- ccdr_gridR(cors = cors,
                        pp = as.integer(pp), nn = as.integer(nn),
                        betas = matrix(0, nrow = pp, ncol = pp),
                        sigmas = rep(-1, pp),
                        weights = rep(1, pp*pp),
                        alpha = 10, gamma = 2, eps = 1e-4, maxIters = 10L, lambdas = 10:1, verbose = FALSE)

    check_zeroes <- check_vars <- TRUE
    for(k in seq_along(final)){
#         check_zeroes <- check_zeroes & all(get.adjacency.matrix(final[[k]]) == 0)
#         check_vars <- check_vars & isTRUE(all.equal(get.rhos(final[[k]]), rep(expected_rhos_value, pp)))

        expect_true(all(get.adjacency.matrix(final[[k]]$sbm) == 0))
        expect_true(isTRUE(all.equal(final[[k]]$sbm$sigmas, rep(expected_rhos_value(nn), pp))))
    }

#     expect_true(check_zeroes)
#     expect_true(check_vars)
})
