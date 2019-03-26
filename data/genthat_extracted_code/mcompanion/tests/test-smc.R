test_that("class SmallMultiCompanion is ok", {
    m <- matrix(c(1, 0.5, 1, 1), ncol = 2)
    jd1 <- new("JordanDecompositionDefault", values = c(1,0), heights=c(1L,1L), vectors = m)
    obj <- new("SmallMultiCompanion", jdMtop = jd1, MbotXtop = m)

    obj
    obj@Mtop
    obj@Mbot

    ## mc.0chain.dx(4,2) # error, mc.0chain.dx() manipulates F0top, so it can't be missing
    ch <- mc.0chain.dx(4,2, list(obj@jdMtop@vectors[ , 2, drop = FALSE] ), obj@Mbot)
    as.matrix(obj@jdMtop@vectors)[ ,2, drop = FALSE]
    eigen(obj@Mtop)

    reduce_chains_simple(ch)

    ## 2015-12-27 commenting out since arg. F0bot hass been removed.
    ##
    ## ex5 <- mc_0chains(4,4,2, list(matrix(c(1,0,1,1), ncol=2)), F0bot = obj@Mbot)
    ## j2mat(ex5)

})

test_that("class JordanDecomposition and SmallMultiCompanion are ok", {
    m <- matrix(c(1, 0, 1, 1), ncol=2)
    jdtmp <- new("JordanDecompositionDefault", values = 0, heights = 2, vectors = m)
    smc1 <- new("SmallMultiCompanion", jdMtop = jdtmp, MbotXtop = m)
    smc1.co <- smc_chains(smc1)

    expect_equal_to_reference( jdtmp, "jd01")
    expect_equal_to_reference( smc1, "smc1")
    expect_equal_to_reference(smc1.co, "smc1_co")

    JordanDecomposition(smc1)

})

