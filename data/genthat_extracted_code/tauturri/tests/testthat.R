library(testthat)
library(tauturri)

# Only run tests if API details are available
if (Sys.getenv("tautulli_url") != "" & Sys.getenv("tautulli_apikey") != "") {
  test_check("tauturri")
}
