
## With these defaults for vectors and rectangular marices, such a generic name for
## mcStable() is probably misleading.
test_that("mcStable works correctly", {
    ## mCompanion generates stable matrices by default
    mc <- mCompanion("sim", dim=4, mo=2)
    expect_true(mcStable(mc))

    ## a square matrix
    m <- matrix(1:9, nrow=3)
    eigen(m)$values
    expect_false(mcStable(m))

    ## a 2x4 matrix, taken to be the top of an mc matrix
    m <- matrix(1:8, nrow=2)
    expect_false(mcStable(m))
    expect_false(mcStable(mCompanion(m)))

    ## a vector, taken to be the top row of an mc matrix
    v <- 1:4
    expect_false(mcStable(v))
    expect_false(mcStable(mCompanion(v)))
    expect_false(all( abs(mc_eigen(mCompanion(v))$values) < 1))

})






