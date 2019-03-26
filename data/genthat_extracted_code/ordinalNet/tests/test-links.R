context("Test link functions.")

testlink <- function(lf, p=c(.1, .4, .2), eps=1e-8)
{

    eta <- lf$g(p)
    k <- length(p)
    q <- matrix(nrow=k, ncol=k)
    for (i in 1:k) {
        etatemp <- eta
        etatemp[i] <- eta[i] + eps
        ptemp <- lf$h(etatemp)
        q[, i] <- (ptemp - p) / eps
    }

    expect_equal(lf$h(eta), p)
    expect_equal(lf$getQ(eta), q)
}

test_that("cumulative cauchit link is correct.", {
    lf <- ordinalNet:::makeLinkfun("cumulative", "logit")
    testlink(lf)
})
test_that("sratio cloglog link is correct.", {
    lf <- ordinalNet:::makeLinkfun("sratio", "cloglog")
    testlink(lf)
})
test_that("cratio probit link is correct.", {
    lf <- ordinalNet:::makeLinkfun("cratio", "probit")
    testlink(lf)
})
test_that("acat logit link is correct.", {
    lf <- ordinalNet:::makeLinkfun("acat", "logit")
    testlink(lf)
})
