library(LendingClub)
context("Account Management")

# skip_on_cran()

test_that("lc_AccountSummary", {
    
    skip_on_cran()
    
    LC_CRED<- lc_MakeCredential(
        investorID= as.character(Sys.getenv("investorId", "", names=F)), 
        APIkey= Sys.getenv("APIkey", "", names=F))
    
    LC_CRED_ERR<- lc_MakeCredential(
        investorID= "123",
        APIkey= "456")
    
    acctsum<- lc_AccountSummary(LC_CRED)
    expect_s3_class(acctsum, "AccountSummary")
    expect_type(acctsum$content, "list")
    expect_error(lc_AccountSummary(LC_CRED="abc"))
    expect_error(lc_AccountSummary(LC_CRED_ERR))
    })
 
test_that("lc_AccountSummary",{
    
    skip_on_cran()
    
    LC_CRED<- lc_MakeCredential(
        investorID= as.character(Sys.getenv("investorId", "", names=F)), 
        APIkey= Sys.getenv("APIkey", "", names=F))
    

    
    expect_warning(acctsum<-AccountSummary(LC_CRED))
    expect_s3_class(acctsum, "LendingClub_api")   
})


test_that("lc_AvailableCash", {
    
    skip_on_cran()
    
    LC_CRED<- lc_MakeCredential(
        investorID= as.character(Sys.getenv("investorId", "", names=F)), 
        APIkey= Sys.getenv("APIkey", "", names=F))
    
    availcash<- lc_AvailableCash(LC_CRED)
    expect_type(availcash,"list")
    expect_s3_class(availcash, "LendingClub_api")
    })
 
test_that("Notes owned", {
    
    skip_on_cran()
    
    LC_CRED<- lc_MakeCredential(
        investorID= as.character(Sys.getenv("investorId", "", names=F)), 
        APIkey= Sys.getenv("APIkey", "", names=F))
    
    notes<- lc_NotesOwned(LC_CRED)
    expect_is(notes$content, "data.frame")
    
    # Detailed notes owned
    d_notes<- lc_DetailedNotesOwned(LC_CRED)
    expect_s3_class(d_notes,"holdings")
    expect_is(d_notes$content, "data.frame")
    expect_is(summary(d_notes), "data.frame")
    })


test_that("lc_PortfoliosOwned", {
    
    skip_on_cran()
    
    LC_CRED<- lc_MakeCredential(
        investorID= as.character(Sys.getenv("investorId", "", names=F)), 
        APIkey= Sys.getenv("APIkey", "", names=F))
    
    ports<- lc_PortfoliosOwned(LC_CRED)
    expect_type(ports$content,"list")
    expect_s3_class(ports, "LendingClub_api")
})


test_that("lc_CreatePortfolio", {
    
    skip_on_cran()
    
    expect_error(lc_CreatePortfolio("abc", LC_CRED="abc"), "Please create the credential object .*") 
})

test_that("lc_PendingTransfers", {
    
    skip_on_cran()
    
    LC_CRED<- lc_MakeCredential(
        investorID= as.character(Sys.getenv("investorId", "", names=F)), 
        APIkey= Sys.getenv("APIkey", "", names=F))
    
    expect_error(lc_PendingTransfers(LC_CRED="abc"), "Please create the credential object .*")
    xfer<- lc_PendingTransfers(LC_CRED)
    expect_is(xfer$content, "data.frame")
    expect_s3_class(xfer, "LendingClub_api")
})
