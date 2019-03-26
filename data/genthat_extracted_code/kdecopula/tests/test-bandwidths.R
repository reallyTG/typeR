context("Bandwidths") 

library(VineCopula) 
set.seed(5) 
u1 <- cbind(runif(20), runif(20)) # low dependence 
u2 <- cbind(u1[, 1], 1 - u1[, 2]) # low dependence (opposite sign) 
u3 <- BiCopSim(20, 3, 10)         # strong positive dependence 
u4 <- cbind(u3[, 1], 1 - u3[, 2]) # strong negative dependence 

test_that("selection works for method 'T'", {
    expect_equal(dim(kdecopula:::bw_t(u1)), c(2, 2))
    
    expect_gt(det(kdecopula:::bw_t(u1)), 0)
    expect_gt(det(kdecopula:::bw_t(u4)), 0)
})

test_that("selection works for methods 'TLLx'", {
    expect_equal(dim(kdecopula:::bw_tll(u1, 1)), c(2, 2))
    expect_equal(dim(kdecopula:::bw_tll(u1, 2)), c(2, 2))
    
    expect_gt(det(kdecopula:::bw_tll(u1, 1)), 0)
    expect_gt(det(kdecopula:::bw_tll(u4, 1)), 0)
    expect_gt(det(kdecopula:::bw_tll(u1, 2)), 0)
    expect_gt(det(kdecopula:::bw_tll(u4, 2)), 0)
})

test_that("selection works for methods 'TLLxnn'", {
    bw1 <- kdecopula:::bw_tll_nn(u1, 1)
    expect_equal(names(bw1), c("B", "alpha", "kappa"))
    expect_equal(dim(bw1$B), c(2, 2))
    expect_length(bw1$alpha, 1)
    expect_length(bw1$kappa, 2)
    expect_gt(bw1$alpha, 0)
    expect_gt(min(bw1$kappa), 0)

    bw2 <- kdecopula:::bw_tll_nn(u3, 2)
    expect_equal(names(bw2), c("B", "alpha", "kappa"))
    expect_equal(dim(bw2$B), c(2, 2))
    expect_length(bw2$alpha, 1)
    expect_length(bw2$kappa, 2)
    expect_gt(bw2$alpha, 0)
    expect_gt(min(bw2$kappa), 0)
    
    expect_gt(det(kdecopula:::bw_tll_nn(u1, 1)$B), 0)
    expect_gt(det(kdecopula:::bw_tll_nn(u4, 1)$B), 0)
    expect_gt(det(kdecopula:::bw_tll_nn(u1, 2)$B), 0)
    expect_gt(det(kdecopula:::bw_tll_nn(u4, 2)$B), 0)
})

test_that("selection works for method 'TTPI'", {
    expect_length(kdecopula:::bw_tt_pi(u1), 4)
    expect_length(kdecopula:::bw_tt_pi(u1, rho.add = FALSE), 4)
    
    expect_equal(kdecopula:::bw_tt_pi(u1, rho.add = FALSE)["rho"], c(rho = 0))
    
    expect_gt(kdecopula:::bw_tt_pi(u3)["h"], 0) 
    
})

test_that("selection works for method 'TTCV'", {
    expect_equal(length(kdecopula:::bw_tt_cv(u1)), 4)
    expect_equal(length(kdecopula:::bw_tt_cv(u1, rho.add = FALSE)), 4)
    
    expect_equal(kdecopula:::bw_tt_cv(u1, rho.add = FALSE)["rho"], c(rho = 0))
    
    expect_gt(kdecopula:::bw_tt_cv(u3)["h"], 0) 
    
})

test_that("selection works for method 'MR'", {
    expect_equal(length(kdecopula:::bw_mr(u1)), 1)
    
    expect_gt0 <- function(bw) expect_gt(bw, 0) 
    expect_gt0(kdecopula:::bw_mr(u1)) 
    expect_gt0(kdecopula:::bw_mr(u2)) 
    expect_gt0(kdecopula:::bw_mr(u3)) 
    expect_gt0(kdecopula:::bw_mr(u4)) 
})

test_that("selection works for method 'beta'", {
    expect_length(kdecopula:::bw_beta(u1), 1)
    
    expect_gt0 <- function(bw) expect_gt(bw, 0) 
    expect_gt0(kdecopula:::bw_beta(u1)) 
    expect_gt0(kdecopula:::bw_beta(u2)) 
    expect_gt0(kdecopula:::bw_beta(u3)) 
    expect_gt0(kdecopula:::bw_beta(u4)) 
})

test_that("selection works for method 'bern'", {
    expect_length(kdecopula:::bw_bern(u1), 1)
    
    expect_gte1 <- function(bw) expect_gte(bw, 1) 
    expect_gte1(kdecopula:::bw_bern(u1)) 
    expect_gte1(kdecopula:::bw_bern(u2)) 
    expect_gte1(kdecopula:::bw_bern(u3)) 
    expect_gte1(kdecopula:::bw_bern(u4)) 
    
    expect_integer <- function(bw) expect_identical(bw, round(bw)) 
    expect_integer(kdecopula:::bw_bern(u1)) 
    expect_integer(kdecopula:::bw_bern(u2)) 
    expect_integer(kdecopula:::bw_bern(u3)) 
    expect_integer(kdecopula:::bw_bern(u4)) 
})
