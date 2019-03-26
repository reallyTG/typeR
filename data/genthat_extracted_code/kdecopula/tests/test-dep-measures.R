context("Dependence measures")

set.seed(5)
u <- VineCopula::BiCopSim(50, 23, -7)
fit <- kdecop(u)

test_that("All measures can be calculated", {
    expect_named(dep_measures(fit, n_qmc = 100), kdecopula:::all_measures)
})

test_that("Measures are in a plausible range", {
    tau <- dep_measures(fit, "kendall", n_qmc = 100)
    expect_gt(tau, -1)
    expect_lt(tau, 0.5)
    
    rho <- dep_measures(fit, "spearman", n_qmc = 100)
    expect_gt(rho, -1)
    expect_lt(rho, 0.5)
    
    beta <- dep_measures(fit, "blomqvist", n_qmc = 100)
    expect_gt(beta, -1)
    expect_lt(beta, 0.5)
    
    gamma <- dep_measures(fit, "gini", n_qmc = 100)
    expect_gt(gamma, -1)
    expect_lt(gamma, 0.5)
    
    vdw <- dep_measures(fit, "vd_waerden", n_qmc = 100)
    expect_gt(vdw, -1)
    expect_lt(vdw, 0.5)
    
    mi <- dep_measures(fit, "minfo", n_qmc = 100)
    expect_gt(mi, 0)
    
    r <- dep_measures(fit, "linfoot", n_qmc = 100)
    expect_gt(r, 0.5)
    expect_lt(r, 1)
})
