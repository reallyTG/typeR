library(testthat)
library(domino)

if (nchar(Sys.getenv("TESTUSER")) > 0 && nchar(Sys.getenv("TESTUSERPASS")) > 0) {
  test_check("domino")
}
