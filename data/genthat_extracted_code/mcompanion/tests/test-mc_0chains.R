
test_that("mc_0chains.struct works correctly", {
    ## 2015-10-19 - moved mc.0chain.structObsolete() and
    ##     the examples and tests involving it to obsmcompanion package
    ##
    y742t <- mc.0chain.struct(7, 4, 2) # sort = TRUE is default
    y742f <- mc.0chain.struct(7, 4, 2, sort = FALSE)

    of <- order(y742f[[2]], decreasing = TRUE)
    y742b <- lapply(y742f, function(x) x[of])
    expect_identical(y742t, y742b)

    expect_error( mc.0chain.struct(5,4,6), info = "mo.col must not be greater than dim")

})

test_that("reduce_chains_simple is correct", {
    m0 <- cbind(c(1,1,1,1), c(0,0,1,1))
    ch1 <- list(m0, m0[ , 1, drop = FALSE])
    ch2 <- c(ch1, list(matrix(c(1,0,0,0), ncol = 1)))
    ch3 <- c(ch1, list(matrix(c(0,0,0,1), ncol = 1)), list(matrix(c(0,0,0,1), ncol = 1)))

    expect_equal_to_reference(reduce_chains_simple(ch1), "0chain.transfch1")
    expect_equal_to_reference(reduce_chains_simple(ch2), "0chain.transfch2")
    expect_equal_to_reference(reduce_chains_simple(ch3), "0chain.transfch3")
})


test_that("mc_0chains is correct", {
              ## see also the doc. for mc_0chains() (it is declared "internal", so is not in
              ## the pdf file; Emacs/ESS doesn't show it either (todo: check if this is the
              ## case also on Linux) )
    ## Note: with 3 arguments this effectively tests mc.0chain.struct(),
    ##       maybe should set tests directly for that.
    expect_equal_to_reference(mc_0chains(6, 4, 1), "mc_0chains_6_4_1")
    expect_equal_to_reference(mc_0chains(6, 4, 2), "mc_0chains_6_4_2")
    expect_equal_to_reference(mc_0chains(6, 4, 3), "mc_0chains_6_4_3")
    expect_equal_to_reference(mc_0chains(6, 4, 4), "mc_0chains_6_4_4")

    expect_equal_to_reference(mc_0chains(6, 2, 2), "mc_0chains_6_2_2")
    expect_equal_to_reference(mc_0chains(6, 2, 4), "mc_0chains_6_2_4")
    expect_equal_to_reference(mc_0chains(6, 2, 3), "mc_0chains_6_2_3")
    expect_equal_to_reference(mc_0chains(6, 2, 3, list(matrix(1,ncol=1,nrow=6))),
                                         "mc_0chains_6_2_3a")
    expect_equal_to_reference(mc_0chains(6, 2, 3, list(matrix(c(1,0,0,0,0,0),ncol=1,nrow=6))),
                              "mc_0chains_6_2_3b")
    expect_equal_to_reference(mc_0chains(6, 2, 3, list(matrix(c(0,1,0,0,0,0),ncol=1,nrow=6))),
                              "mc_0chains_6_2_3c")
    expect_equal_to_reference(mc_0chains(6, 2, 3, list(matrix(c(0,0,0,0,0,1),ncol=1,nrow=6))),
                              "mc_0chains_6_2_3d")
    expect_equal_to_reference(mc_0chains(6, 2, 3, list(matrix(c(0,0,0,0,1,0),ncol=1,nrow=6))),
                              "mc_0chains_6_2_3e")

    ## expect_equal_to_reference(mc_0chains(6, 2, 3,list(matrix(c(0,1),ncol=1,nrow=2)))

    expect_equal_to_reference(mc_0chains(6, 4, 2), "mc_0chains_6_4_2")
    ## TODO: rework these tests to work after the drop of argument F0bot.
    ## F0bot <-  matrix(1:4, nrow=2)
    ## expect_equal_to_reference(
    ##     mc_0chains(6, 4, 2, list(matrix(c(0,1), ncol=1, nrow=2)), F0bot = F0bot),
    ##     "mc_0chains_6_4_2a")
    ## expect_equal_to_reference(
    ##     mc_0chains(6, 4, 2, list(matrix(c(1,1), ncol=1, nrow=2)), F0bot = F0bot),
    ##     "mc_0chains_6_4_2b")

    expect_equal_to_reference(mc_0chains(12,4,2), "mc_0chains_12_4_2")

    expect_equal_to_reference(mc_0chains(2, 2, 2, list(matrix(c(0,1), ncol=1, nrow=2))),
                              "mc_0chains_2_2_2a")

})


