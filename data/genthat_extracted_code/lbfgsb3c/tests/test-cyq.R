# Ref: Fletcher, R. (1965) Function minimization without
#   calculating derivatives -- a review,
#         Computer J., 8, 33-41.

# Note we do not have all components here e.g., .jsd, .h
## context("Fletcher's Chebyquad problem")

cyq.f <- function(x) {
    rv <- cyq.res(x)
    f <- sum(rv * rv)
}

cyq.res <- function(x) {
    # Fletcher's chebyquad function m = n -- residuals
    n <- length(x)
    res <- rep(0, n)  # initialize
    for (i in 1:n) {
        #loop over resids
        rr <- 0
        for (k in 1:n) {
            z7 <- 1
            z2 <- 2 * x[k] - 1
            z8 <- z2
            j <- 1
            while (j < i) {
                z6 <- z7
                z7 <- z8
                z8 <- 2 * z2 * z7 - z6  # recurrence to compute Chebyshev polynomial
                j <- j + 1
            }  # end recurrence loop
            rr <- rr + z8
        }  # end loop on k
        rr <- rr/n
        if (2 * trunc(i/2) == i) {
            rr <- rr + 1/(i * i - 1)
        }
        res[i] <- rr
    }  # end loop on i
    res
}

cyq.jac <- function(x) {
    #  Chebyquad Jacobian matrix
    n <- length(x)
    cj <- matrix(0, n, n)
    for (i in 1:n) {
        # loop over rows
        for (k in 1:n) {
            # loop over columns (parameters)
            z5 <- 0
            cj[i, k] <- 2
            z8 <- 2 * x[k] - 1
            z2 <- z8
            z7 <- 1
            j <- 1
            while (j < i) {
                # recurrence loop
                z4 <- z5
                z5 <- cj[i, k]
                cj[i, k] <- 4 * z8 + 2 * z2 * z5 - z4
                z6 <- z7
                z7 <- z8
                z8 <- 2 * z2 * z7 - z6
                j <- j + 1
            }  # end recurrence loop
            cj[i, k] <- cj[i, k]/n
        }  # end loop on k
    }  # end loop on i
    cj
}


cyq.g <- function(x) {
    cj <- cyq.jac(x)
    rv <- cyq.res(x)
    gg <- as.vector(2 * rv %*% cj)
}


# nn <- c(2, 3, 5, 8, 10, 20, 30)
nn <- c(2, 3, 5, 8)

for (n in nn) {
    str <- paste0("Chebyquad in ", n, " parameters");
    context(str)
    test_that(str, {
        lower <- rep(-10, n)
        upper <- rep(10, n)
        bdmsk <- rep(1, n)  # free all parameters
        x0 <- 1:n
        x0 <- x0/(n + 1)  # Initial value suggested by Fletcher
        ans <- lbfgsb3c(x0, cyq.f, cyq.g, lower,
                        upper, control = list())
        if (n == 2){
            expect_equal(c(0.211, 0.789), round(ans$par, 3))
            expect_equal(0, round(ans$value, 3))
        } else if (n == 3){
            expect_equal(c(0.146, 0.5, 0.854), round(ans$par, 3))
            expect_equal(0, round(ans$value, 3))
        } else if (n == 5){
            expect_equal(c(0.084, 0.313, 0.5, 0.687, 0.916),
                         round(ans$par, 3))
            expect_equal(0,
                         round(ans$value, 3))
        } else if (n == 8){
            expect_equal(c(0.043, 0.193, 0.266, 0.5, 0.5, 0.734, 0.807, 0.957),
                         round(ans$par, 3))
            expect_equal(0.004,
                         round(ans$value, 3))
        }
    })

}
