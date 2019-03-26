context("S3 generics")

set.seed(5)
u <- VineCopula::BiCopSim(10, 3, 3)
est <- kdecop(u, method = "TLL1nn")

test_that("print and summary work without error", {
    # test TLL2nn
    colnames(u) <- c("V1", "V2") 
    est <- kdecop(u)
    expect_output(print(est))
    expect_output(summary(est))
    
    methods_to_test <- c("MR", "beta", "TLL1", "T", "TTPI")
    for (method in methods_to_test) {
        est <- kdecop(u, method = method)
        expect_output(print(est))
        expect_output(summary(est))
    }
})

test_that("logLik works with and without precomputed info", {
    # checks if it runs and df is properly set
    expect_gt(attr(logLik(est), "df"), 0)
    est <- kdecop(u, method = "bern", info = FALSE)
    expect_gt(attr(logLik(est), "df"), 0)
})

test_that("predict calls correct (d/p/h)kdecop function", {
    expect_equal(predict(est, u), dkdecop(u, est))
    expect_equal(predict(est, u, "cdf"), pkdecop(u, est))
    expect_equal(predict(est, u, "hfunc1"), hkdecop(u, est, 1))
    expect_equal(predict(est, u, "hfunc2"), hkdecop(u, est, 2))
    expect_equal(predict(est, u, "hinv1"), hkdecop(u, est, 1, inverse = TRUE))
    expect_equal(predict(est, u, "hinv2"), hkdecop(u, est, 2, inverse = TRUE))
})

test_that("fitted equals predict on original data", {
    expect_equal(predict(est, u), fitted(est))
    expect_equal(predict(est, u, "cdf"), fitted(est, "cdf"))
    expect_equal(predict(est, u, "hfunc1"), fitted(est, "hfunc1"))
    expect_equal(predict(est, u, "hfunc2"), fitted(est, "hfunc2"))
    expect_equal(predict(est, u, "hinv1"), fitted(est, "hinv1"))
    expect_equal(predict(est, u, "hinv2"), fitted(est, "hinv2"))
})

test_that("simulate equals rkdecop output", {
    set.seed(1)
    sim <- rkdecop(500, est)
    set.seed(1)
    simq <- rkdecop(500, est, quasi = TRUE)
    expect_equal(simulate(est, 500, seed = 1), sim)
    expect_equal(simulate(est, 500, seed = 1, quasi = TRUE), simq)
})

test_that("plotting functionality works", {
    # default methods
    plot(est)
    contour(est)
    
    # parametrized methods
    types <- c("surface", "contour")
    margins <- c("norm", "unif", "exp", "flexp")
    for (t in types) {
        for (m in margins) {
            plot(est, t, m)
            contour(est, m)
        }
    }
    expect_warning(plot(est, size = 2))
    
    # custom xlim
    plot(est, xlim = seq(0.01, 0.99, l = 6))
})
