context("Zielke")
test_that("Test Matrices", {
    Z1 <- Matrix(998)
    Z2 <- Matrix(c(998, 0, 0, 0), 2, 2)
    X1 <- testMatX(Z1, Z1)
    X2 <- testMatX(Z2, Z2)

    expect_true(
        all.equal(
            X1,
            Matrix(c(999, 999, 998, 999, 998, 998, 998, 998, 997), ncol = 3)
        )
    )

    expect_true(
        all.equal(
            X2,
            Matrix(c(999, 0, 999, 0, 998, 0,
                     0, 1, 0, 1, 0, 0,
                     999, 0, 998, 0, 998, 0,
                     0, 1, 0, 0, 0, 0,
                     998, 0, 998, 0, 997, 0,
                     0, 0, 0, 0, 0, -1),
                   ncol = 6)
        )
    )
})
