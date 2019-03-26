

context('Test Dual Construction')

#' @useDynLib GFORCE kmeans_dual_solution_primal_min_R
test_that("Dual Construction",{
    skip_on_cran()
    set.seed(12345) #need to set seed bc doesnt always exist
    d <- 20
    K <- 5
    dat <- gforce.generator(K,d,d,3,graph='DeltaC',cov_gap_mult=6)
    gh <- gforce.Gamma(dat$X)
    sh <- t(dat$X)%*%dat$X / d
    diff <- sh - diag(gh)

    dc1 <- gforce.certify(dat$group_assignments,-diff)
    dc2 <- dual_solution(dat$group_assignments,diff)
    expect_equal(sum(dc1$Y_a)*2 + K*dc1$Y_T,dc2$dual_value)
    })