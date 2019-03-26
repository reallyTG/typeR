test_that("enpy", {
    if (requireNamespace("lars", quietly = TRUE) &&
        requireNamespace("robustbase", quietly = TRUE)) {
        source("enpy.old.R", local = TRUE)

        n <- 500L
        p <- 50L
        set.seed(12345)
        x <- matrix(rnorm(n * p), ncol = p)
        y <- 2 + x %*% c(1, 1, 1, rep.int(0, p - 3L)) + rnorm(n)

        ##
        ## No penalization at all
        ##
        alpha <- 0
        lambda <- 0

        new <- pense::enpy(
            x,
            y,
            alpha = alpha,
            lambda = lambda,
            delta = 0.5,
            options = initest_options(
                psc_method = "rr",
                maxit = 5,
                psc_keep = 0.2,
                resid_keep_method = "proportion",
                resid_keep_prop = 0.6
            ),
            en_options = en_options_aug_lars()
        )

        target <- enpy(x, y, lambda1 = alpha * lambda, lambda2 = 0.5 * (1 - alpha) * lambda,
                       deltaesc = 0.5, cc.scale = 1.54764, psc.method = "rr",
                       prosac = 0.8, clean.method = "proportion", prop = 0.4,
                       py.nit = 5, en.tol = 1e-8)

        diffs <- apply(new$coeff, 2, function(x) {
            min(colSums(abs(target$coeff - x)))
        })

        expect_lt(sum(abs(diffs)), 1e-8)
    }

})
