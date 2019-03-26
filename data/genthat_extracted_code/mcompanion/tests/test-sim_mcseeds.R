
test_that("sim_chains() works correctly", {
    ## TODO: sim_chains() is meant to replace sim_mcseeds() (from which it is derived
    ## by default the arguments of complex numbers are in (0, pi)

    compare1 <- function(..., seed = 123){
        set.seed(seed); a <- sim_mcseeds(...)
        set.seed(seed); b <- sim_chains(...)
        list(mcseeds = a, chains = b)
    }

    s0 <- compare1(4, type = c("r", "cp"))
    expect_identical(s0$mcseeds, s0$chains)
    s0b <- s0$chains
    expect_equal_to_reference(s0b, "sim_chains_001" )
    expect_true(all( 0 <= Arg(s0b)  & Arg(s0b) <= pi ))
    expect_equal(dim(s0b), c(4, 2))

    ## here they should be in (-pi/2, 0)
    s1 <- compare1(4, type = c("r", "cp"), argarg = list(-pi/2, 0))
    expect_identical(s1$mcseeds, s1$chains)
    s1b <- s1$chains
    expect_true(all(Im(s1b[ , 1]) == 0)) # 1st col. is "r"

    expect_true(any(Im(s1b[ , 2]) != 0)) # 2st col. is "cp"
    expect_true(all( -pi/2 <= Arg(s1b[ , 2])  & Arg(s1b[ , 2]) <= 0 ))

})


test_that("spec_root0 is correct", {

          })
