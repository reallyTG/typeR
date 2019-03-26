# no ties
x <- matrix(sample.int(200), 20, 10)
colnames(x) <- letters[1:10]

# with ties
xt <- x
xt[1:5, 1:2] <- xt[6:10, 1:2]
colnames(xt) <- letters[1:10]

w <- c(rep(2, 10), rep(0, 10))

context("weighted computations: wdm()")

for (method in wdm:::allowed_methods) {
    test_that(paste("method", method, "is correct"), {
        expect_equal(
            wdm(x, method = method, weights = w),
            wdm(x[1:10, ], method = method)
        )
        if (method == "hoeffding")  # not adjusted for ties
            return(TRUE)
        expect_equal(
            wdm(xt, method = method, weights = w),
            wdm(xt[1:10, ], method = method)
        )
    })
}

context("weighted computations: indep_test()")

for (method in wdm:::allowed_methods) {
    test_that(paste("method", method, "is correct"), {
        expect_equal(
            indep_test(x[, 1], x[, 2], method = method, weights = w),
            indep_test(x[1:10, 1], x[1:10, 2], method = method)
        )
        if (method == "hoeffding")  # not adjusted for ties
            return(TRUE)
        expect_equal(
            indep_test(xt[, 1], xt[, 2], method = method, weights = w),
            indep_test(xt[1:10, 1], xt[1:10, 2], method = method)
        )
    })
}
