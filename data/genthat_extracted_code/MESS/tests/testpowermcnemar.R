context("Test power_mcnemar_test")


##
## All of these checks should provide the correct results
##

test_that("Produces validated results", {
    expect_equal(round(power_mcnemar_test(paid=0.05, psi=45/5, power=.8)$n), 22.0)
    expect_equal(round(power_mcnemar_test(paid=0.05, psi=45/5, power=.8, alternative="one.sided")$n), 17.0)
    expect_equal(round(power_mcnemar_test(144, paid=0.25, psi=45/25, method="exact", alternative="one.sided", sig.level=0.025)$power, 2), 0.80)    
})



test_that("Checking symmetry of results", {
    expect_equivalent(power_mcnemar_test(paid=0.05, psi=45/5, power=.8), power_mcnemar_test(paid=0.45, psi=5/45, power=.8))
})
