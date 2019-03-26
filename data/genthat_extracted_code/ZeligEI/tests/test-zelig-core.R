# FAIL TEST setx and sim should fail with ZeligEI ------------------------------
test_that('FAIL TEST setx and sim should fail with ZeligEI', {
    library("eiPack", quietly = TRUE)
    data(senc)
    z.out <- zeirxc$new()
    z.out$zelig(cbind(dem, rep, non) ~ cbind(black, white, natam),
                N = "total", data = senc)

    expect_error(z.out$setx(), 'Function is not relevant for ZeligEI objects.')
    expect_error(setx(z.out), 'Function is not relevant for ZeligEI objects.')

    expect_error(z.out$sim(), 'Function is not relevant for ZeligEI objects.')
    expect_error(sim(z.out), 'Function is not relevant for ZeligEI objects.')
})
