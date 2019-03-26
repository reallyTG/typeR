test_that("Sarima and Arma models work ok", {
    sm0 <- new("SarimaModel", nseasons = 12)
    sm1 <- new("SarimaModel", nseasons = 12, intercept = 3)
    sm1b <- new("SarimaModel", sm0, intercept = 3)
    identical(sm1, sm1b) # TRUE

    sm2  <- new("SarimaModel", ar = 0.9, nseasons = 12, intercept = 3, sigma2 = 1)
    sm2b <- new("SarimaModel", sm1, ar = 0.9, sigma2 = 1)
    sm2c <- new("SarimaModel", sm0, ar = 0.9, intercept = 3, sigma2 = 1)

    expect_identical(sm2, sm2b)
    expect_identical(sm2, sm2c)

    sm3 <- new("SarimaModel", ar = 0.9, sar= 0.8, nseasons = 12, intercept = 3, sigma2 = 1)
    expect_equal_to_reference(sm3, "sm3.RDS")

    sm3b <- new("SarimaModel", sm2, sar = 0.8)

    expect_error(new("MaModel", ma = 0.9, ar = 0.5), "Autoregressive terms found in MaModel")
    expect_error(new("ArModel", ma = 0.9, ar = 0.5), "Moving average terms found in ArModel")
})
