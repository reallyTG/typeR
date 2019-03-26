library(LendingClub)
context("MakeCredential")

skip_on_cran()

test_that("lc_Make Credential", {
    expect_s3_class( lc_MakeCredential("x","y"), "LendingClub_credential")
    expect_equal(CheckCred(c("abc","def")),c("abc","def"))
    expect_error(CheckCred("abc","Please create the credential object.*"))
    })


