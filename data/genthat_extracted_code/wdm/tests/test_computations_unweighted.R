set.seed(5)

# no ties
x <- matrix(sample.int(200), 20, 10)
colnames(x) <- letters[1:10]

# with ties
xt <- x
xt[1:5, 1:2] <- xt[6:10, 1:2]
colnames(xt) <- letters[1:10]

context("unweighted computations: wdm()")

cor_methods <- c("pearson", "kendall", "spearman")

for (method in cor_methods) {
    test_that(paste("method", method, "is correct"), {
        expect_equal(wdm(x, method = method), cor(x, method = method))
        expect_equal(wdm(xt, method = method), cor(xt, method = method))
    })
}

test_that("method hoeffding is correct", {
    expect_equal(wdm(x, method = "hoeffd"), Hmisc::hoeffd(x)$D)
    # no tie correction in wdm
})

test_that("method blomqvist is correct", {
    expect_equal(
        wdm(x[, 1], x[, 2], method = "blomqvist"),
        copula::betan(copula::pobs(x[, 1:2]))
    )
    expect_equal(
        wdm(xt[, 1], xt[, 2], method = "blomqvist"),
        copula::betan(copula::pobs(xt[, 1:2]))
    )
    # b/c of median, calculations are slightly different for odd n
    expect_equal(
        wdm(x[-1, 1], x[-1, 2], method = "blomqvist"),
        copula::betan(copula::pobs(x[-1, 1:2]))
    )
    expect_equal(
        wdm(xt[-1, 1], xt[-1, 2], method = "blomqvist"),
        copula::betan(copula::pobs(xt[-1, 1:2]))
    )
})


# -------------------------------------------------------------
context("unweighted computations: indep_test()")


# induce some dependence
x <- x[, 1]
y <- x
y[1:10] <- sample.int(10)

xt <- xt[, 1]
yt <- xt
yt[1:10] <- sample.int(10)


for (method in cor_methods) {
    test_that(paste("method", method, "is correct"), {
        expect_equal(
            indep_test(x, y, method = method)$p_value,
            cor.test(x, y, method = method, exact = FALSE)$p.value,
            tol = 3e-2
        )
        expect_equal(
            indep_test(xt, yt, method = method)$p_value,
            cor.test(xt, yt, method = method, exact = FALSE)$p.value,
            tol = 3e-2
        )
    })
}

test_that("method hoeffding is correct", {
    expect_equal(
        indep_test(x, y, method = "hoeffd")$p_value,
        Hmisc::hoeffd(x, y)$P[1, 2],
        tol = 3e-2
    )
    # no tie correction in indep_test
})

test_that("method blomqvist is correct", {
    # simualte a few p-values under the null
    ps <- sapply(1:10000, function(i)
        indep_test(runif(100), runif(100), method = "blomqvist")$p_value
    )
    expect_equal(mean(ps < 0.05), 0.05, tol = 0.025)
    expect_equal(mean(ps < 0.01), 0.01, tol = 0.01)
})


