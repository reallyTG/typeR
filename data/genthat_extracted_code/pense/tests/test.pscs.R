test_that("Compute PSCs", {
    pscs_R <- function(x, y, intercept = TRUE) {
        if (identical(intercept, TRUE)) {
            x <- cbind(1, x)
        }

        xextCp <- crossprod(x)
        xsqrt <- chol(xextCp)
        txsqrtxx <- backsolve(xsqrt, t(x), transpose = TRUE)

        H <- x %*% backsolve(xsqrt, txsqrtxx)
        resids <- as.vector(y - H %*% y)
        Wd <- resids / (1 - diag(H))

        G <- txsqrtxx %*% diag(Wd)
        Q <- tcrossprod(G)

        egQ <- eigen(Q)
        # Z <- apply(egQ$vectors, 2, crossprod, txsqrtxx)
        Z <- crossprod(txsqrtxx, egQ$vectors)
        return(Z[ , order(egQ$values)])
    }

    ##
    ## Normal use case
    ##
    n <- 200L
    p <- 50L
    set.seed(12345)
    x <- matrix(rnorm(n * p), ncol = p)
    y <- 2 + x %*% c(1, 1, 1, rep.int(0, p - 3L)) + rnorm(n)

    res_r <- pscs_R(x, y)
    res_c <- pense::prinsens(x, y)

    expect_lt(mean(abs(abs(res_r / res_c) - 1)), 1e-9)

    res_r <- pscs_R(x, y, intercept = FALSE)
    res_c <- pense::prinsens(x, y, intercept = FALSE)

    expect_lt(mean(abs(abs(res_r / res_c) - 1)), 1e-9)

    ##
    ## Singular matrix
    ##
    n <- 20L
    p <- 50L
    set.seed(12345)
    x <- matrix(rnorm(n * p), ncol = p)
    y <- 2 + x %*% c(1, 1, 1, rep.int(0, p - 3L)) + rnorm(n)

    expect_error(pense::prinsens(x, y), regexp = "singular")
})
