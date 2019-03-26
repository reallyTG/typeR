library(mnis)
context("mnis_mps_on_date")

test_that("mnis_mps_on_date return expected format", {

  skip_on_cran()

  xmpon <- mnis_mps_on_date("2017-04-30")
  expect_length(xmpon, 22)
  expect_type(xmpon, "list")
  expect_true(tibble::is_tibble(xmpon))
  expect_true(nrow(xmpon)==649)

  xmpon2 <- mnis_mps_on_date(date1="1990-04-30", date2="2015-05-10")
  expect_length(xmpon2, 21)
  expect_type(xmpon2, "list")
  expect_true(tibble::is_tibble(xmpon2))
  expect_true(nrow(xmpon2)==1730)

  xpod <- mnis_peers_on_date("2017-04-30")
  expect_length(xpod, 21)
  expect_type(xpod, "list")
  expect_true(tibble::is_tibble(xpod))
  expect_true(nrow(xpod)==835)

  xpod2 <- mnis_peers_on_date(date2="1990-04-30", date1="2015-05-10")
  expect_length(xpod2, 21)
  expect_type(xpod2, "list")
  expect_true(tibble::is_tibble(xpod2))
  expect_true(nrow(xpod2)==2231)

  xpod3 <- mnis_peers_on_date(date1="1990-04-30", date2="2015-05-10")
  expect_length(xpod3, 21)
  expect_type(xpod3, "list")
  expect_true(tibble::is_tibble(xpod3))
  expect_true(nrow(xpod3)==2231)

})
