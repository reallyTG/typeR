test_that("Zero in Hist", {
  
  testthat::skip_on_cran()
  testthat::skip_on_travis()
  # Fixes issue in https://github.com/muschellij2/gcite/issues/2
  user = "juybEFMAAAAJ"
  url = gcite_user_url(user = user)
  expect_silent(gcite_cite_over_time(doc = url))
  
})
