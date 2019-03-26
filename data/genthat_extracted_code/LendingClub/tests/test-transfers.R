library(LendingClub)
context("Transfers")

test_that("lc_Add Funds", {
    
    skip_on_cran()
    
    expect_error(lc_AddFunds(25, "LOAD_WEEKLY"),"start required for future transfers")
    expect_error(lc_AddFunds("A","LOAD_ONCE"), "amount must be numeric")
    expect_error(lc_AddFunds(25, "Foo"), "freq value does not match acceptable values")
    expect_error(lc_AddFunds(25, "LOAD_WEEKLY", start="1234"), "start is not a valid .*")
})

test_that("WithdrawFunds", {
    
    skip_on_cran()
    
    expect_error(lc_WithdrawFunds(5, LC_CRED="abc"), "Please create the credential object.*")
    expect_error(lc_WithdrawFunds(-2, LC_CRED="abc"),"Enter positive .*")
})


test_that("PendingTransfer", {
    
    skip_on_cran()
    
    expect_error(lc_WithdrawFunds(5, LC_CRED="abc"), "Please create the credential object.*")
})

test_that("CancelTransfers", {
    
    skip_on_cran()
    
    expect_error(lc_CancelTransfer(5, LC_CRED="abc"), "Please create the credential object.*")
})