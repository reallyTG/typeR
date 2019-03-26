context("Density Calculation")

N <- 100
vX <- runif(N, -5, 5)
vX2 <- abs(vX)

test_that("Densities are consistent with no truncation", {
    d1 <- dtn(vX)
    d2 <- dnorm(vX)
    expect_true(all(d1 == d2))
}
          )

test_that("1/2 Normal densities are 2 times Normal Densities", {
    d1 <- dtn(.x = vX2, .low = rep(0, N))
    d2 <- dnorm(vX2)
    expect_true(all(d1 == 2 * d2))
}
          )

test_that("Densities identical across shifts", {

    vShifts <- c(-10:10)
    vMs <- c(0, 1, 2, 5)
    vLs <- c(-Inf, -2, 3)
    vHs <- c(0, 2, 5)

    for (m in vMs) {
        for (b in 1:length(vLs)) {
            mD <- sapply(vShifts,
                         function(S) dtn(.x = vX + S,
                                         .mean = rep(m + S, N),
                                         .sd = rep(1, N),
                                         .low = rep(vLs[b] + S, N),
                                         .high = rep(vHs[b] + S, N)
                                         )
                         )
            expect_true(all(apply(mD, 1, sd) == 0))
        }
    }
}
          )
