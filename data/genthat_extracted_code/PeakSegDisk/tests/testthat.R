library(testthat)

suite <- Sys.getenv("TEST_SUITE")
if(suite=="")suite <- NULL
test_check("PeakSegDisk", filter=suite)
